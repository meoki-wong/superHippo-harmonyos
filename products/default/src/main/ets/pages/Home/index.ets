
// import Tabbar from '../../components/Tabbar'
// import HomeSwiper from './components/Swiper'
import { HomeSwiper, HomeNavList } from './components'
@Entry
@Component
struct Home {

  build() {
    Column({space: 5}){
      HomeSwiper()
      Row(){
        HomeNavList()
      }.padding({left: 20, right: 20})
    }
  }
}

export default Home