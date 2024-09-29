
import SwiperCust from '../components/SwiperCust'
@Entry
@Component
struct TestPage {


  build() {
    Row(){
      SwiperCust({itemList: [$r('app.media.girl3'), $r('app.media.girl1'), $r('app.media.girl2'),  $r('app.media.girl4')]}).width('100%')
    }.width('100%').padding({left: 20, right: 20})
  }
}