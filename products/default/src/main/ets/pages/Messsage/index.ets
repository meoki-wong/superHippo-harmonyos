import { Navbar } from '../../components'
import { newFriendList, chatList } from './Mock/MockData'
import { FriendListType, ChatListItemType } from './types'
import uiEffect from '@ohos.graphics.uiEffect'
import router from '@ohos.router'
import { CommonConstants } from '../../constants/CommonConstants'

@Entry
@Component
export default struct Message {
  scroller: Scroller = new Scroller()
  // 毛玻璃 仅真机生效
  filter = (show: boolean | undefined | null): uiEffect.Filter => uiEffect.createFilter().blur(show ? 20 : 0)
  goFriendDetails = () => {
    router.pushUrl({
      url: CommonConstants.SELECT_FRIEND_DETAIL
    })
  }

  build() {
    Column() {
      Navbar({
        title: '消息',
        showMoreIcon: true,
        showOpacity: true,
        fontColor: '#fff'
      }).margin(0)
      Column() {
        Row() {
          Text('新朋友').fontSize(16)
            .fontWeight(500).fontColor('#fff').margin({ left: 20 })
          Row() {
            Image($r('app.media.address_book_icon')).width(16).height(16).margin({ right: 4 })
            Text('通讯录')
              .textAlign(TextAlign.Center)
              .fontColor('#fff')

              .fontSize(16)
              .fontWeight(500)

          }
          .backgroundColor('rgba(0,0,0,0.3)')
          .width(80)
          .margin({ right: 20 })
          .borderRadius(5)
          .justifyContent(FlexAlign.Center)
          .height(32)
        }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({ bottom: 16 }).alignItems(VerticalAlign.Center)

        Flex() {
          ForEach(newFriendList, (item: FriendListType) => {
            Stack() {
              Image(item.uri)
                .width(75)
                .height(100)
                .borderRadius(8)
                .interpolation(ImageInterpolation.High)
                .compositingFilter(this.filter(item.needCloud))
              Text(item.desc).position({ left: 8, bottom: 4 }).fontColor('#fff').fontSize(11).fontWeight(400)
            }.margin({ right: 8 }).onClick(() => this.goFriendDetails())
          })
          Column() {
            Image($r('app.media.friend_arrow_right')).width(13).height(13).borderRadius(50).margin({ bottom: 3 })
            Text('全部配对').width(13).fontSize(12).fontWeight(500).fontColor('#CAC0E0')
          }
          .width(41)
          .height(100)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .linearGradient({
            angle: 180,
            colors: [['#312351', 0], ['#322757', 1]]
          })
          .backgroundColor('rgba(255,255,255,0.62)')
          .borderRadius(8)
        }.margin({ left: 20, right: 20 })
      }.margin({ bottom: 20 })

      Flex({ justifyContent: FlexAlign.Start }) {
        Column() {
          Text('消息')
            .fontSize(16)
            .fontWeight(500)
            .fontColor('#fff')
            .textAlign(TextAlign.Center)
            .width(40)
            .margin({ bottom: 8 })
          Row().width(16).height(3).backgroundColor('#fff').borderRadius(2)
        }.margin({ left: 20 }).width(40).justifyContent(FlexAlign.Center)
      }.width('100%').margin({ bottom: 17 })

      Scroll(this.scroller) {
        List() {
          ForEach(chatList, (item: ChatListItemType) => {
            ListItem() {
              Flex() {
                Stack() {
                  Image(item.uri)
                    .width(56)
                    .height(56)
                    .borderRadius(50)
                    .margin({ right: 12 })
                    .flexShrink(0)
                    .compositingFilter(this.filter(item.needCloud))
                  Row()
                    .width(8)
                    .height(8)
                    .borderRadius(50)
                    .backgroundColor('#7AFE59')
                    .position({ right: 8, bottom: 8 })
                    .visibility(item.online ? Visibility.Visible : Visibility.None)
                }

                Column() {
                  Text(item.nickname)
                    .margin({ bottom: 6 })
                    .font({ size: 15, weight: 500 })
                    .fontColor('#fff')
                    .textAlign(TextAlign.Start)
                    .width('100%')
                  Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Text(item.lastMsg).font({ size: 13, weight: 400 }).fontColor('#8678A3')
                    Text(item.time).font({ size: 12, weight: 400 }).fontColor('#8678A3')
                  }
                }.margin({ top: 6, bottom: 5 })
              }
            }.height(56).margin({ bottom: 24, left: 20, right: 20 })
          })
        }

      }.scrollBarColor('rgba(0,0,0,0)').height('calc(100% - 205vp)')
    }
    .padding({ bottom: 80 })
    .backgroundImage('https://barplatform-test.oss-cn-beijing.aliyuncs.com/2024/06/1878ee6c6d778143d6b79ae47b9fd1c392msg-bg.png')
    .width('100%')
    .height('100%')
    .backgroundImageSize({ width: '100%', height: 200 })
    .backgroundColor('#121325')

  }
}