import { promptAction } from '@kit.ArkUI'


export const showMessage = (message: string = '', duration: number = 1000) => {
  promptAction.showToast({
    message,
    duration
  })
}