import { Navbar } from '../../../components'
import { feedBackItemList } from '../utils/commonData'
import { feedBackItemListType } from '../types'
import { showMessage } from '../../../common/utils/promptShow'
@Entry

struct FeedBack {
  @State selectRadio: number = -1
  submitFeedBack = () => {
    if(this.selectRadio >= 0){
      showMessage('提交成功')
      return
    }
    showMessage('请选择举报原因')
  }
  changeRadio =(isChange: boolean, index: number) => {
    if(isChange){
      this.selectRadio = index
    }
  }
  build() {
    Column(){
      Navbar({
        showBackIcon: true,
        bgColor: "#121325"
      }).margin(0)
     Column(){
       Text('举报资料').width('100%').font({weight: 500, size: 16}).fontColor('#fff').margin({top: 23, bottom: 3})
       Text('请告诉我们你想举报该用户的理由').font({weight: 400, size: 12}).fontColor('#8678A3').margin({bottom: 20}).width('100%')
       Column(){
          ForEach(feedBackItemList, (item: feedBackItemListType, index: number) => {
            Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}){
              Text(){
                Span(item.title).font({size: 14, weight: 400}).fontColor('#fff')
                Span(` (${item.desc})`).font({size: 13, weight: 400}).fontColor('#8678A3')
              }
              Radio({
                value: `feedback_${index}}`,
                group: 'feedback'
              }).onChange((isChange: boolean) => this.changeRadio(isChange, index))
            }.height(50).width('100%').borderColor('rgba(255,255,255,0.1)').borderWidth({bottom: feedBackItemList.length-1 === index? 0 : 1 })
          })
       }.width('100%').linearGradient({
         angle: 180,
         colors: [['#312351', 0], ['#322757', 1]]
       }).borderRadius(12).padding({left: 20, right: 20})

     }.padding({left: 20, right: 20})
      Row(){
        Text('举报').linearGradient({
          angle: 90,
          colors: [['#9D61FD', 0], ['#4161FF', 1]]
        }).font({weight: 500, size: 16}).fontColor('#fff').textAlign(TextAlign.Center).width('100%').height(56).onClick(this.submitFeedBack)
      }.padding({left: 20, right: 20}).position({ bottom: 24})
    }.width('100%').height('100%').backgroundColor('#121325')

  }
}