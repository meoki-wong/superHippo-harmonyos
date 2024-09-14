import HomeCommonData from '../utils/common'
import { ProductTabsType } from '../types/HomeType'

@Component
export default struct ProductList {
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      /**
       * tabs
       */
      Scroll(this.scroller) {
        Flex() {

          ForEach(HomeCommonData.product_tabs_list, (items: ProductTabsType, index) => {
            Row() {
              Flex({ justifyContent: FlexAlign.Center }) {

                Column() {
                  Text(items.fir_floor)
                    .textAlign(TextAlign.Center)
                    .fontSize(14)
                    .fontWeight(500)
                    .fontColor('#E5E5E5')
                    .fontFamily('PingFangSC, PingFang SC')
                    .width(19)
                    .visibility(!items.fir_floor ? Visibility.None : Visibility.Visible)
                  Text(items.sec_floor)
                    .width(19)
                    .textAlign(TextAlign.Center)
                    .fontSize(14)
                    .fontWeight(500)
                    .fontColor('#E5E5E5')
                    .fontFamily('PingFangSC, PingFang SC')
                    .visibility(!items.sec_floor ? Visibility.None : Visibility.Visible)
                }.margin({ left: 9.5 })

                Text(items.title)
                  .width(30)
                  .fontSize(24)
                  .fontWeight(500)
                  .fontColor('#E5E5E5')
                  .fontFamily('PingFangSC, PingFang SC')
                  .textAlign(TextAlign.Center)
              }

              Divider()
                .strokeWidth(1)
                .color('#E5E5E5')
                .vertical(true)
                .margin({ left: index === 0 ? 19 : 10 })
                .height(59)
            }.alignItems(VerticalAlign.Top)
          })
        }
      }.scrollable(ScrollDirection.Horizontal).scrollBarColor('rgba(0,0,0,0)')

      /**
       * 商品列表
       */



    }.margin({ top: 30 })
  }
}