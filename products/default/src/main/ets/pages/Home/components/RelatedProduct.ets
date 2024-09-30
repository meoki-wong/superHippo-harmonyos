import SwiperCust from '../../../components/SwiperCust'
import HomeCommonData from '../utils/common'
@Component
export default struct RelatedProduct {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text('Circle 周边').fontSize(14).fontWeight(500).fontFamily('PingFangSC, PingFang SC').fontColor('#000')
        Text('Recommend').fontSize(14).fontWeight(500).fontFamily('PingFangSC, PingFang SC').fontColor('#000')
      }.margin({ bottom: 20 })

      SwiperCust({itemList: HomeCommonData.home_relate_swiper}).width('100%')
    }.margin({ top: 20 })
    .backgroundImageSize(ImageSize.Cover)
  }
}