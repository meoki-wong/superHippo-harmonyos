import { StrangePersonList } from '../utils/MockData'
import { StrangePersonType } from '../types'

@Component
export default struct SwiperForSearchPeople {
  @State offsetVal: number = 0
  @State StrangePersonList: Array<StrangePersonType> = []
  @State changeWidthVal: number = 0
  @State changeHeightVal: number = 0
  @State changeOffsetVal: number = 0
  aboutToAppear(): void {
    this.StrangePersonList = [...StrangePersonList]
  }
  setWidthValue = (index: number) => {
    let list = [340, 320, 300]
    return list[index] + this.changeWidthVal || 0
  }
  setHeightValue = (index: number) => {
    let list = [590, 570, 550]
    return list[index] + this.changeHeightVal || 0

  }
  handleStartMovePic = (offset: number) => {
    let absoluteVal = Math.abs(offset)
    this.offsetVal = offset
  }
  handleUpdateMovePic = (offset: number) => {
    this.offsetVal = offset
    let absoluteVal = Math.abs(offset)
    if(absoluteVal > 210){
      this.changeWidthVal = 20
      this.changeHeightVal = 20
      this.changeOffsetVal = 1
    } else {
      this.changeWidthVal = absoluteVal / 10
      this.changeHeightVal = absoluteVal / 10
      this.changeOffsetVal = 0
    }

  }
  handleEndMovePic = () => {
    if (Math.abs(this.offsetVal) > 200) {
      animateTo({
        duration: 50,
        onFinish: () => {
          this.offsetVal = 0
          this.changeWidthVal = 0
          this.changeHeightVal = 0
          this.changeOffsetVal = 0
        }
      }, () => {
        this.offsetVal = this.offsetVal > 0 ? 3000 : -3000
        this.StrangePersonList.shift()
      })

      return
    }
    animateTo({
      duration: 300
    }, () => {
      this.offsetVal = 0
    })
  }
  handleDislikePerson = () => {
    animateTo({
      duration: 300,
      onFinish: () => {
        this.StrangePersonList.shift()
        this.offsetVal = 0
        this.changeWidthVal = 0
        this.changeHeightVal = 0
        this.changeOffsetVal = 0

      }
    }, () => {
      this.offsetVal = -600
      this.changeWidthVal = 20
      this.changeHeightVal = 20
      this.changeOffsetVal = 1
    })

  }
  handleLikePerson = () => {
    animateTo({
      duration: 300,
      onFinish: () => {
        this.StrangePersonList.shift()
        this.offsetVal = 0
        this.changeWidthVal = 0
        this.changeHeightVal = 0
        this.changeOffsetVal = 0

      }
    }, () => {
      this.offsetVal = 600
      this.changeWidthVal = 20
      this.changeHeightVal = 20
      this.changeOffsetVal = 1
    })
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      ForEach(this.StrangePersonList, (item: StrangePersonType, index: number) => {
        Column() {
          Stack() {
            Image(item.uri).width(this.setWidthValue(index)).height(this.setHeightValue(index)).borderRadius(12)
            Column() {
              Text(item.name)
                .font({ size: 24, weight: 500, family: 'PingFangSC, PingFang SC' })
                .fontColor('#fff')
                .textAlign(TextAlign.Start)
                .margin({ bottom: 6 })
              Flex({ alignItems: ItemAlign.Center }) {
                Text(String(item.distance)).fontColor('#F7C539').font({ size: 14, weight: 500 }).margin({ right: 5 })
                Text('km').fontColor('#fff').font({ weight: 400, size: 12 }).margin({ right: 10 })
                Text(item.address).fontColor('#fff').font({ weight: 400, size: 12 })
              }.margin({ bottom: 11 })

              Flex() {
                Row() {
                  Text(`${item.gender === 0 ? '♂' : '♀'} ${item.age}`)
                    .font({ size: 12, weight: 400 })
                    .fontColor('#fff')
                    .textAlign(TextAlign.Center)
                }
                .width(46)
                .height(24)
                .borderRadius(5)
                .backgroundColor('#FF406A')
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)

                Row() {
                  Text(item.constellation).font({ size: 12, weight: 400 })
                    .fontColor('#fff')
                    .textAlign(TextAlign.Center).width('100%')
                }
                .width(51)
                .height(24)
                .backgroundColor('rgba(255,255,255,0.4)')
                .borderRadius(5)
                .margin({ left: 5, right: 5 })

                Row() {
                  Text(`${item.bodyHeight}cm`).font({ size: 12, weight: 400 })
                    .fontColor('#fff')
                    .textAlign(TextAlign.Center).width('100%')
                }.width(51).height(24).backgroundColor('rgba(255,255,255,0.4)').borderRadius(5)
              }.margin({ bottom: 24 })

              /*
               * 操作按钮
               * */
              Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                Row() {
                  Image($r('app.media.arrow_bottom')).width(20).height(20)
                }
                .width(40)
                .height(40)
                .borderRadius(23)
                .backgroundColor('rgba(42, 42, 42, 0.8)')
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)

                Row() {
                  Row() {
                    Image($r('app.media.dislike_icon')).width(26).height(26)
                  }
                  .width(93)
                  .height(45)
                  .borderRadius(23)
                  .alignItems(VerticalAlign.Center)
                  .justifyContent(FlexAlign.Center)
                  .margin({ right: 16 })
                  .backgroundColor('#2A2A2A')
                  .onClick(this.handleDislikePerson)

                  Row() {
                    Image($r('app.media.like_icon')).width(26).height(26)
                  }
                  .width(93)
                  .height(45)
                  .borderRadius(23)
                  .alignItems(VerticalAlign.Center)
                  .justifyContent(FlexAlign.Center)
                  .backgroundColor('#2A2A2A')
                  .onClick(this.handleLikePerson)
                }
              }.margin({ bottom: 24 })
            }
            .width('100%')
            .position({ bottom: 0, left: 0 })
            .padding({ left: 20, right: 20 })
            .alignItems(HorizontalAlign.Start)
          }
        }
        .visibility(index > 2 ? Visibility.None : Visibility.Visible)
        .zIndex(10 - index)
        .offset({
          x: index === 0 ? this.offsetVal : 0,
          y: 3 - (index - this.changeOffsetVal) * 12
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