import { Navbar } from '../../components'
import { CardDataStatisticsType, BalanceCardShowListItemType, DynamicListItemType } from './types'
import MineCommonData from './utils/commonData'
import MoodListComponent from './components/MoodList'
@Entry
@Component
export default struct Mine {
  scroller: Scroller = new Scroller()
  @State showNavbar: boolean = false
  @State scrollCount: number = 0
  @State navBgColor: string = 'rgba(72,195,255,0)'
  @State selectListIndex: number = 0
  handleSelectDynamic = (index: number): void => {
    this.selectListIndex = index
  }
  observerScroll = (xOffset: number, yOffset: number) => {
    this.scrollCount += yOffset
    let color = (this.scrollCount - 60) / 100 >= 1 ? 1 : (this.scrollCount - 60) / 100
    this.showNavbar = this.scrollCount > 60
    this.navBgColor = `rgba(72,195,255, ${color})`
    console.log('---监听页面滚动事件', yOffset, this.scrollCount, color)
  }

  build() {
    Column() {
      Navbar({
        title: '我的',
        showMoreIcon: true,
        bgColor: this.navBgColor,
        fontColor: '#fff'
      }).margin(0)
      Scroll(this.scroller) {
        Column() {
          Stack({ alignContent: Alignment.Start }) {
            Button('编辑').width(71).height(36).linearGradient({
              angle: 90,
              colors: [['#9D61FD', 0], ['#4161FF', 1]]
            }).position({ top: 23, right: 20 })
            Column() {
              Stack({ alignContent: Alignment.Start }) {
                Image($r('app.media.avatar'))
                  .width(98)
                  .height(98)
                  .border({
                    color: 'rgba(54,39,88,0.65)',
                    width: 4,
                    style: BorderStyle.Solid,
                    radius: 50
                  })
                  .backgroundColor('#9C61FD')
                  .margin({ top: -40 })
                Image($r("app.media.vip_icon")).width(58).height(18).position({ bottom: -1, left: 20 })
              }.width('100%')

              Text('幼儿园里的灭霸')
                .font({ size: 18, weight: 400, family: 'PingFangSC, PingFang SC' })
                .fontColor('#fff')
                .margin({ top: 9 })
                .textAlign(TextAlign.Start)
                .width('100%')
              Text('姐妹带你一起猛踹瘸子那条好腿。。。')
                .textAlign(TextAlign.Start)
                .width('100%')
                .font({ size: 14, weight: 400, family: 'PingFangSC, PingFang SC' })
                .fontColor('#8678A3')
                .margin({ top: 6 })
              Flex({ justifyContent: FlexAlign.SpaceAround }) {
                ForEach(MineCommonData.CardDataStatistics, (item: CardDataStatisticsType) => {
                  Column() {
                    Text('563')
                      .font({ size: 17, weight: 500, family: 'AppleSystemUIFont' })
                      .fontColor('#fff')
                      .margin({ bottom: 1 })
                    Text('喜欢我')
                      .font({ size: 12, weight: 400, family: 'PingFangSC, PingFang SC' })
                      .fontColor('#CAC0E0')
                  }
                })
              }
              .margin({
                top: 16,
                right: 38,
                left: 0,
                bottom: 15
              })
            }.position({ left: 20 })
          }
          .margin({ bottom: 14, top: 80 })
          .height('auto')
          .width(335)
          .linearGradient({
            angle: 180,
            colors: [['#312351', 0], ['#322757', 1]]
          })
          .borderRadius(12)

          /*
           * 我的余额
           * */

          Column() {
            Text('我的余额').height(17).width('100%').font({ size: 12, weight: 400 }).fontColor('#fff')
            Text(String(29302.09)).width('100%').height(45).font({ size: 32, weight: 500 }).fontColor('#fff')
            Divider().strokeWidth(1).color('#7C69FF').margin({ top: 7, bottom: 10 })
            Row() {
              ForEach(MineCommonData.BalanceCardShowList, (item: BalanceCardShowListItemType, index: number) => {
                Row() {
                  Image(item.uri).width(13).height(13).margin({ right: 2 }).interpolation(ImageInterpolation.High)
                  Text(item.title).font({ size: 12, weight: 400 }).fontColor('#EEEBFF')
                }

                Divider()
                  .strokeWidth(1)
                  .color('#7C69FF')
                  .vertical(true)
                  .height(9)
                  .margin({ left: 20, right: 20 })
                  .visibility(MineCommonData.BalanceCardShowList.length - 1 === index ? Visibility.None :
                  Visibility.Visible)
              })
            }

            Button() {
              Text('充值中心')
                .fontColor('#674FFE')
                .font({ size: 12, weight: 400 })
                .lineHeight(17)
                .textAlign(TextAlign.Center)
            }.width(78).height(27).backgroundColor('#fff').position({ top: 2, right: 0 })
          }
          .width(335)
          .height(127)
          .backgroundImage($r('app.media.mine_balance_icon'))
          .backgroundImageSize(ImageSize.Cover)
          .margin({ bottom: 16 })
          .padding(16)


          /*
           * 我的动态  /  优选动态
           * */


          Flex({ justifyContent: FlexAlign.Start }) {
            ForEach(MineCommonData.DynamicList, (item: DynamicListItemType, index: number) => {
              Column() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(500)
                  .fontColor(this.selectListIndex === index ? '#fff' : '#CAC0E0')
                  .textAlign(TextAlign.Center)
                  .margin({ bottom: 8 })
                Row()
                  .width(16)
                  .height(3)
                  .backgroundColor('#fff')
                  .borderRadius(2)
                  .visibility(this.selectListIndex === index ? Visibility.Visible : Visibility.Hidden)
              }.margin({ left: 20 }).justifyContent(FlexAlign.Center).onClick(() => this.handleSelectDynamic(index))
            })

          }.width('100%').margin({ bottom: 17 })

          /*
           * 动态列表
           * */
          Column(){
            Flex(){
              Text('今天').margin({right: 12}).flexShrink(0).font({size: 15, weight: 400, family: 'PingFangSC, PingFang SC'}).fontColor('#CAC0E0')
              Stack(){
                Text('+  发布动态，让大家看到你').font({size: 14, weight: 400}).fontColor('#fff')
              }.width(293).height(70).linearGradient({
                angle: 180,
                colors: [['#312351', 0], ['#322757', 1]]
              }).borderRadius(12)
            }.margin({bottom: 20})
            MoodListComponent()
          }.padding({left: 20, right: 20})

        }
        .padding({ bottom: 80 })
        .justifyContent(FlexAlign.Start)

      }.scrollBarColor('rgba(0,0,0,0)').onWillScroll(this.observerScroll).height('auto')
    }
    .width('100%')
    .height('100%')
    .backgroundImageSize({ width: '100%', height: 200 })
    .backgroundColor('#121325')
    .backgroundImage('https://barplatform-test.oss-cn-beijing.aliyuncs.com/2024/06/1878ee6c6d778143d6b79ae47b9fd1c392msg-bg.png')
    .justifyContent(FlexAlign.Start)

  }
}