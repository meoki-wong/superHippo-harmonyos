import { StrangePersonList } from '../utils/MockData'
import { StrangePersonType } from '../types'
import { ItemState } from '@kit.ArkUI'

@Component
export default struct SwiperForSearchPeople {
  @State offsetVal: number = 0
  setWidthValue = (index: number) => {
    let list = [340, 323, 306]
    return list[index] || 0
  }
  setHeightValue = (index: number) => {
    let list = [588, 565.25, 535.5]
    return list[index] || 0

  }
  handleStartMovePic = (offset: number) => {
    this.offsetVal = offset
  }
  handleUpdateMovePic = (offset: number) => {
    this.offsetVal = offset
  }
  handleEndMovePic = () => {
    this.offsetVal = 0
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      ForEach(StrangePersonList, (item: StrangePersonType, index: number) => {
        Column() {
          Stack() {
            Image(item.uri).width(this.setWidthValue(index)).height(this.setHeightValue(index)).borderRadius(12)
            Column() {
              Text(item.name).font({ size: 24, weight: 500, family: 'PingFangSC, PingFang SC' }).fontColor('#fff').textAlign(TextAlign.Start).margin({bottom: 6})
              Flex({alignItems: ItemAlign.Center}){
                Text(String(item.distance)).fontColor('#F7C539').font({size: 14, weight: 500}).margin({right: 5})
                Text('km').fontColor('#fff').font({weight: 400, size: 12}).margin({right: 10})
                Text(item.address).fontColor('#fff').font({weight: 400, size: 12})
              }.margin({bottom: 11})
            }.width('100%').position({bottom: 0, left: 0}).padding({left: 20, right: 20}).alignItems(HorizontalAlign.Start)
          }
        }
        .visibility(index > 2 ? Visibility.None : Visibility.Visible)
        .zIndex(10 - index)
        .offset({
          x: index === 0 ? this.offsetVal : 0,
          y: 3 - index * 12
        })
        .width('100%')
        .gesture(
          PanGesture({ direction: PanDirection.Horizontal }).onActionStart((event: GestureEvent) => {
            this.handleStartMovePic(event.offsetX)
          }).onActionUpdate((event: GestureEvent) => {
            this.handleUpdateMovePic(event.offsetX)
          }).onActionEnd(() => {
            this.handleEndMovePic()
          })
        )
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          centerX: '0%',
          centerY: '100%',
          angle: index === 0 ? this.offsetVal / 10 : 0
        })
      })
    }
  }
}