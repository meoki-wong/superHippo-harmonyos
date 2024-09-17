import { Navbar } from '../../components'
import { newFriendList, chatList } from './Mock/MockData'
import { FriendListType, ChatListItemType } from './types'
import uiEffect from '@ohos.graphics.uiEffect'

@Entry
@Component
export default struct Mine {
  scroller: Scroller = new Scroller()
  build() {
    Column() {
      Navbar({
        title: '我的',
        showMoreIcon: true,
        showOpacity: true,
        fontColor: '#fff'
      }).margin(0)
      Stack() {
      /*
       * 我的头像部分  回家在写吧  累了
       * */
      }.margin({ bottom: 20 })

      Flex({justifyContent: FlexAlign.Start}) {
        Column(){
          Text('消息')
            .fontSize(16)
            .fontWeight(500)
            .fontColor('#fff')
            .textAlign(TextAlign.Center)
            .width(40)
            .margin({ bottom: 8 })
          Row().width(16).height(3).backgroundColor('#fff').borderRadius(2)
        }.margin({left: 20}).width(40).justifyContent(FlexAlign.Center)
      }.width('100%').margin({bottom: 17})

      Scroll(this.scroller) {
        List(){
          ForEach(chatList, (item: ChatListItemType) => {
            ListItem(){
              Flex(){
                Stack(){
                  Image(item.uri).width(56).height(56).borderRadius(50).margin({right: 12}).flexShrink(0)
                  Row().width(8).height(8).borderRadius(50).backgroundColor('#7AFE59').position({right: 8, bottom: 8}).visibility(item.online? Visibility.Visible : Visibility.None)
                }
                Column(){
                  Text(item.nickname).margin({bottom: 6}).font({size: 15, weight: 500}).fontColor('#fff').textAlign(TextAlign.Start).width('100%')
                  Flex({justifyContent: FlexAlign.SpaceBetween}){
                    Text(item.lastMsg).font({size: 13, weight: 400}).fontColor('#8678A3')
                    Text(item.time).font({size: 12, weight: 400}).fontColor('#8678A3')
                  }
                }.margin({top: 6, bottom: 5})
              }
            }.height(56).margin({bottom: 24, left: 20, right: 20})
          })
        }

      }.scrollBarColor('rgba(0,0,0,0)').height('calc(100% - 205vp)')
    }.padding({bottom: 80})
    .backgroundImage('https://barplatform-test.oss-cn-beijing.aliyuncs.com/2024/06/1878ee6c6d778143d6b79ae47b9fd1c392msg-bg.png')
    .width('100%')
    .height('100%')
    .backgroundImageSize({ width: '100%', height: 200 })
    .backgroundColor('#121325')

  }
}