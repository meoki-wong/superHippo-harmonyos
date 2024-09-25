import { Navbar } from '../../../components'
import system_camera from '../../../common/Plugins/Camera'
import SelectPicUtils from '../../../common/Plugins/SelectPic'
import UploadPicUtils from '../../../common/Plugins/UploadPic'

@Entry
@Component
struct PostNews {
  @State value: string = ''
  @State pictureList: Array<string> = []
  selectPic = async (): Promise<void> => {
    let picList: string[] = await SelectPicUtils.requestSaveImage() || []
    console.log('picList', picList)
    this.pictureList.push(...picList)
  }
  // 删除照片
  deleteImage = (index: number) => {
    this.pictureList.splice(index, 1)
  }

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
        TextArea({ text: $$this.value })
          .fontColor('#fff')
          .caretColor('#fff')
          .showCounter(true)
          .constraintSize({ maxHeight: '100%' })
          .defaultFocus(true)
        Grid() {
          ForEach(this.pictureList, (item: string, index: number) => {
            GridItem() {
              Stack() {
                Image(item).width(60).height(60).borderRadius(6).borderColor('#322655')
                Image($r('app.media.delete_icon'))
                  .width(16)
                  .height(16)
                  .position({ top: 0, right: 0 })
                  .onClick(() => this.deleteImage(index))
              }
            }
          })
        }.rowsGap(10).columnsGap(10).margin({ bottom: 21 })

        Row() {
          Stack() {
            Image($r('app.media.camera_icon'))
              .width(24)
              .height(24)
              .onClick(SelectPicUtils.requestSaveImage)
              .position({ left: 0, top: 0 })
              .zIndex(-1)
            SaveButton({ text: SaveDescription.SAVE })
              .onClick(UploadPicUtils.handleWriteFile)
              .width(24)
              .height(24)
              .backgroundColor('rgba(0,0,0,0)')
              .constraintSize({ maxWidth: 24, maxHeight: 24 })
          }.width(24).height(24).margin({ right: 18 })

          Image($r('app.media.photo_icon')).width(24).height(24).onClick(this.selectPic)

        }.width('100%').alignItems(VerticalAlign.Center)
      }.padding({ left: 20, right: 20 })
    }.backgroundColor('#121325').width('100%').height('100%')
  }
}