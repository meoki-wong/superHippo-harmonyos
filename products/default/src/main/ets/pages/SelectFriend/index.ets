import { Navbar } from '../../components'
import SwiperForSearchPerson from './components/SwiperForSearchPeople'

@Entry
@Component
export default struct SelectFriend {
  build() {
    Column() {
      Navbar({
        title: '约吧',
        showMoreIcon: true,
        bgColor: 'rgba(18,19,37,1)',
        fontColor: '#fff'
      }).margin(0)
      Column(){
        SwiperForSearchPerson().margin({top: 16})
      }.padding({left: 20, right: 20})
    }.backgroundColor('#121325').height('100%').width('100%')
  }
}