import { abilityAccessCtrl, common } from '@kit.AbilityKit'
import { showMessage } from '../utils/promptShow'
import { dataSharePredicates } from '@kit.ArkData'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { BusinessError } from '@kit.BasicServicesKit'

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager()
let appContext: common.Context = getContext(this)

class SelectPic {
  uris: string[] = []
  photoCount = 0
  requestSaveImage = async () => {
    const photoSelectOptions = new photoAccessHelper.PhotoSelectOptions(); // 创建图片-音频类型文件-预览的图库选项实例
    // 选择媒体文件类型和选择媒体文件的最大数目
    photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE; // 选择媒体文件类型为Image
    photoSelectOptions.maxSelectNumber = 2; // 选择媒体文件的最大数目
    // TODO：知识点：创建图库选择器实例，调用photoViewPicker.select()接口拉起图库界面进行文件选择，文件选择成功后，返回photoSelectResult结果集。
    const photoViewPicker = new photoAccessHelper.PhotoViewPicker();
    try {
      let photoSelectResult = await photoViewPicker.select(photoSelectOptions)
      // select返回的uri权限是只读权限，需要将uri写入全局变量@State中即可进行读取文件数据操作。
      return photoSelectResult.photoUris || []
    } catch (err) {
      return [];
    }


  }
}

const SelectPicUtils = new SelectPic()

export default SelectPicUtils