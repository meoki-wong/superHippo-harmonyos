import Navbar from '../../../components/Navbar'
import { StrangePersonList, userTagList } from '../utils/MockData'
import { StrangePersonType } from '../types'
import { CommonConstants } from '../../../constants/CommonConstants'
import router from '@ohos.router'

@Entry
@Component
export default struct FriendDetail {
  @State swiperIndex: number = 0
  scroller: Scroller = new Scroller()
  swiperController: SwiperController = new SwiperController()

  goFeedBack = () => {
    router.pushUrl({
      url: CommonConstants.SELECT_FRIEND_FEEDBACK
    })
  }
  build() {
    Column(){
      Navbar({
        showMoreIcon: true,
        showOpacity: true,
        showBackIcon: true
      })
      Scroll(this.scroller){
        Column() {
          Stack() {
            Swiper(this.swiperController) {
              ForEach(StrangePersonList, (item: StrangePersonType, index:number) => {
                Image(item.uri).width('100%').height(480).borderRadius({ bottomLeft: 12, bottomRight: 12 })
              })
            }.indicator(false).autoPlay(true).onChange((index: number) => {
              this.swiperIndex = index
            }).backgroundColor('#121325')

            Row() {
              ForEach(StrangePersonList, (item: StrangePersonType, index: number) => {
                Image(item.uri)
                  .width(40)
                  .height(40)
                  .borderRadius({ bottomLeft: 12, bottomRight: 12 })
                  .margin({ right: 9 })
                  .borderRadius(4)
                  .borderWidth(this.swiperIndex === index ? 1 : 0)
                  .borderColor('#fff')
                  .onClick(() => {
                    this.swiperController.changeIndex(index)
                  })
              })
            }.position({ left: 20, bottom: 16 })
          }

          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Text('哈哈啊哈哈哈').font({ family: 'PingFangSC, PingFang SC', size: 24, weight: 500 }).fontColor('#fff')
              Row() {
                Image($r('app.media.hi_icon')).width(18).height(18).margin({ right: 5 })
                Text('打招呼').font({ family: 'AppleSystemUIFont', weight: 500, size: 13 }).fontColor('#fff')
              }
              .linearGradient({
                angle: 90,
                colors: [['#9D61FD', 0], ['#4161FF', 0]]
              })
              .borderRadius(20)
              .height(36)
              .width(91)
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
            }

            Row() {
              Row() {
                Image($r('app.media.female_icon')).width(10).height(10).margin({ right: 4 })
                Text('26').font({ weight: 400, size: 12 }).fontColor('#fff')
              }
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
              .width(46)
              .height(24)
              .borderRadius(5)
              .backgroundColor('#FF406A')
            }.width('100%').margin({ top: 10 })

            Row() {
              Text() {
                Span('32.44km')
                Span('·')
                Span('北京市 海淀区')
              }.font({ family: 'PingFangSC, PingFang SC', weight: 400, size: 12 }).fontColor('#CAC0E0')
            }.margin({ top: 14, bottom: 16 }).width('100%')

            Flex({wrap: FlexWrap.Wrap}){
              ForEach(userTagList, (item: string) => {
                Text(item)
                  .constraintSize({minWidth: 50})
                  .height(21)
                  .textAlign(TextAlign.Center)
                  .borderRadius(5)
                  .padding({top: 4, bottom: 4, left: 15, right: 15})
                  .linearGradient({
                    angle: 180,
                    colors: [['#312351', 0], ['#322757', 1]]
                  })
                  .margin({ right: 8, bottom: 8 })
                  .font({size: 13, weight: 400}).fontColor('#CAC0E0')
              })
            }
            Column(){
              Text('关于我').margin({bottom: 15}).width('100%').font({size: 16, weight: 500}).fontColor('#fff')
              Text('是个懒人 及其被动 摩羯 充满热情 熟悉是个懒人 及其被动 摩羯 充满热情 熟悉').font({size: 14, weight: 400}).fontColor('#CAC0E0')
            }.width('100%').margin({bottom: 32})
            Text('举报或反馈').font({weight: 400, size: 12}).fontColor('#8678A3').onClick(this.goFeedBack)
          }.padding({ left: 20, right: 20 }).margin({ top: 17, bottom: 30 })

        }.width('100%').constraintSize({minHeight: '100%'}).backgroundColor('#121325')
      }
    }


  }
}