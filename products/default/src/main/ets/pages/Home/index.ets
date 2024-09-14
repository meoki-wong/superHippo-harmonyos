import { HomeSwiper, HomeNavList, UserOption, RelatedProduct, ProductList } from './components'
import HomeCommonData from './utils/common'

@Entry
@Component
struct Home {
  scroll: Scroller = new Scroller()

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 }) {
        HomeSwiper()
        Column() {
          Row() {
            HomeNavList()
          }

          Row() {
            UserOption({ list: HomeCommonData.User_option_list })
          }

          Row() {
            RelatedProduct()
          }

          Column() {
            Divider().strokeWidth(1).color($r('app.color.home_divider')).margin({ top: 48 })
            UserOption({ list: HomeCommonData.Home_calendar_list })
          }

          Row() {
            ProductList()
          }
        }.padding({ left: 20, right: 20 })
      }
    }.scrollBarColor('rgba(0,0,0,0)')

  }
}

export default Home