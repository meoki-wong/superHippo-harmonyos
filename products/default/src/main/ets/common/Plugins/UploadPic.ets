import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ResponseCode from '@ohos.net.http';
import fs from '@ohos.file.fs';
import { showMessage } from '../utils/promptShow'
import { image } from '@kit.ImageKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { common } from '@kit.AbilityKit';
import fileIo from '@ohos.file.fs';

class UploadPic {


  static shared = new UploadPic()
  imageBuffer: ArrayBuffer | undefined = undefined // 图片ArrayBuffer
  image: PixelMap | undefined = undefined

  async getPicture() {
    http.createHttp()
      // 显示网络图片的地址
      .request('https://gitee.com/harmonyos-cases/cases/raw/master/CommonAppDevelopment/feature/variablewatch/src/main/resources/base/media/variablewatch_grape.png',
        (error: BusinessError, data: http.HttpResponse) => {
          if (error) {
            // 下载失败时弹窗提示检查网络，不执行后续逻辑
            showMessage('网络错误，请重试', 1500)
            return;
          }
          this.transcodePixelMap(data);
          // 判断网络获取到的资源是否为ArrayBuffer类型
          if (data.result instanceof ArrayBuffer) {
            this.imageBuffer = data.result as ArrayBuffer;
            this.saveImage(this.imageBuffer)
          }
        }
      )
  }

  /**
   * 使用createPixelMap将ArrayBuffer类型的图片装换为PixelMap类型
   * @param data：网络获取到的资源
   */
  transcodePixelMap = (data: http.HttpResponse) => {
    if (ResponseCode.ResponseCode.OK === data.responseCode) {
      const imageData: ArrayBuffer = data.result as ArrayBuffer;
      // 通过ArrayBuffer创建图片源实例。
      const imageSource: image.ImageSource = image.createImageSource(imageData);
      const options: image.InitializationOptions = {
        'alphaType': 0, // 透明度
        'editable': false, // 是否可编辑
        'pixelFormat': 3, // 像素格式
        'scaleMode': 1, // 缩略值
        'size': { height: 100, width: 100 }
      }; // 创建图片大小

      // 通过属性创建PixelMap
      imageSource.createPixelMap(options).then((pixelMap: PixelMap) => {
        this.image = pixelMap;
        console.log('-----thisimages', this.image)
      });
    }
  }

  /**
   * 保存ArrayBuffer到图库
   * @param buffer：图片ArrayBuffer
   * @returns
   */
  async saveImage(buffer: ArrayBuffer | string): Promise<void> {
    const context = getContext(this) as common.UIAbilityContext; // 获取getPhotoAccessHelper需要的context
    const helper = photoAccessHelper.getPhotoAccessHelper(context); // 获取相册管理模块的实例
    const uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg'); // 指定待创建的文件类型、后缀和创建选项，创建图片或视频资源
    const file = await fs.open(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    await fs.write(file.fd, buffer);
    await fs.close(file.fd);
  }

  handleWriteFile = async (event: ClickEvent, result: SaveButtonOnClickResult) => {

    if(result === SaveButtonOnClickResult.SUCCESS){
      try {
        http.createHttp()
          // 显示网络图片的地址
          .request('https://gitee.com/harmonyos-cases/cases/raw/master/CommonAppDevelopment/feature/variablewatch/src/main/resources/base/media/variablewatch_grape.png',
            async (error: BusinessError, data: http.HttpResponse) => {
              if (error) {
                // 下载失败时弹窗提示检查网络，不执行后续逻辑
                showMessage('网络错误，请重试', 1500)
                return;
              }
              this.transcodePixelMap(data);
              // 判断网络获取到的资源是否为ArrayBuffer类型
              if (data.result instanceof ArrayBuffer) {
                const context = getContext(this);
                let helper = photoAccessHelper.getPhotoAccessHelper(context);
                // onClick触发后10秒内通过createAsset接口创建图片文件，10秒后createAsset权限收回。
                let uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'png');
                // 使用uri打开文件，可以持续写入内容，写入过程不受时间限制
                let file = await fileIo.open(uri, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                // 写入文件
                await fileIo.write(file.fd, data.result);
                // 关闭文件
                await fileIo.close(file.fd);
              }
            }
          )

      } catch (error) {
        console.error("error is "+ JSON.stringify(error));
      }
    }
  }
}

const UploadPicUtils = new UploadPic()

export default UploadPicUtils