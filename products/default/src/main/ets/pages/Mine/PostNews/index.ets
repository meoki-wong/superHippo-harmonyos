import { Navbar } from '../../../components'
import system_camera from '../../../common/Plugins/Camera'
import SelectPicUtils from '../../../common/Plugins/SelectPic'
import UploadPicUtils from '../../../common/Plugins/UploadPic'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { fileIo } from '@kit.CoreFileKit'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { showMessage } from '../../../common/utils/promptShow'

@Entry
@Component

struct PostNews {
  @State value: string = ''

  // handleWriteFile = async (event: ClickEvent, result: SaveButtonOnClickResult) => {
  //
  //   if(result === SaveButtonOnClickResult.SUCCESS){
  //     try {
  //       http.createHttp()
  //         // 显示网络图片的地址
  //         .request('https://gitee.com/harmonyos-cases/cases/raw/master/CommonAppDevelopment/feature/variablewatch/src/main/resources/base/media/variablewatch_grape.png',
  //           async (error: BusinessError, data: http.HttpResponse) => {
  //             if (error) {
  //               // 下载失败时弹窗提示检查网络，不执行后续逻辑
  //               showMessage('网络错误，请重试', 1500)
  //               return;
  //             }
  //             PhotoSystems.UploadPic.transcodePixelMap(data);
  //             // 判断网络获取到的资源是否为ArrayBuffer类型
  //             if (data.result instanceof ArrayBuffer) {
  //               const context = getContext(this);
  //               let helper = photoAccessHelper.getPhotoAccessHelper(context);
  //               // onClick触发后10秒内通过createAsset接口创建图片文件，10秒后createAsset权限收回。
  //               let uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'png');
  //               // 使用uri打开文件，可以持续写入内容，写入过程不受时间限制
  //               let file = await fileIo.open(uri, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  //               // 写入文件
  //               await fileIo.write(file.fd, data.result);
  //               // 关闭文件
  //               await fileIo.close(file.fd);
  //             }
  //           }
  //         )
  //
  //     } catch (error) {
  //       console.error("error is "+ JSON.stringify(error));
  //     }
  //   }
  // }
  build() {
    Column() {
      Navbar({
        title: '',
        showBackIcon: true,
        bgColor: 'rgba(18,19,37,1)',
      }).margin(0)
      Column() {
        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Row() {
            Image($r('app.media.avatar'))
              .width(40)
              .height(40)
              .border({
                width: 2,
                color: '#fff',
                style: BorderStyle.Solid,
                radius: 50
              })
              .margin({ right: 15 })
            Text('风吹麦浪').font({ size: 16, weight: 500, family: 'PingFangSC, PingFang SC' }).fontColor('#fff')
          }

          Button() {
            Row() {
              Text('发布')
                .margin({ right: 7 })
                .font({ size: 13, weight: 500, family: 'PingFangSC, PingFang SC' })
                .fontColor('#fff')
              Image($r('app.media.push_icon')).width(12).height(12)
            }
          }.width(91).height(36).linearGradient({
            angle: 90,
            colors: [['#9D61FD', 0], ['#4161FF', 1]]
          }).borderRadius(20)
        }.margin({ top: 25, bottom: 19 })

        Divider().strokeWidth(1).opacity(0.03).color('#fff')
        TextArea({text: $$this.value}).fontColor('#fff').caretColor('#fff').showCounter(true).constraintSize({maxHeight: '100%'}).defaultFocus(true)
        Row(){
          Stack(){
            Image($r('app.media.camera_icon')).width(24).height(24).onClick(SelectPicUtils.requestSaveImage).position({left: 0, top: 0}).zIndex(-1)
            SaveButton({text: SaveDescription.SAVE}).onClick(UploadPicUtils.handleWriteFile).width(24).height(24).backgroundColor('rgba(0,0,0,0)').constraintSize({maxWidth: 24, maxHeight: 24})
          }.width(24).height(24).margin({right: 18})
          Image($r('app.media.photo_icon')).width(24).height(24).onClick(SelectPicUtils.requestSaveImage)

        }.width('100%').alignItems(VerticalAlign.Center)
      }.padding({ left: 20, right: 20 })
    }.backgroundColor('#121325').width('100%').height('100%')
  }
}