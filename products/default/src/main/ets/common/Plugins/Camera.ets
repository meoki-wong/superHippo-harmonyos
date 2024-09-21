import { camera, cameraPicker as picker } from '@kit.CameraKit'
import { common } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'


let mContext = getContext(this) as common.Context
const system_camera = async () => {

  try{
    let pickerProfile: picker.PickerProfile = {
      cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
    }
    let pickerResult: picker.PickerResult = await picker.pick(mContext, [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], pickerProfile)
    console.log('---拍照', JSON.stringify(pickerResult))
  }catch (error){
    console.log('---拍照报错', error)
  }
}

export default system_camera