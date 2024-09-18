
import { MoodList } from '../Mock/MockData'
import { MoodListTypeItem } from '../types'
@Component
export default struct MoodListComponent {

  private ImageSize: number = 87
  build() {
    Column(){
      ForEach(MoodList, (item: MoodListTypeItem) => {
        Flex({alignItems: ItemAlign.Start}){
          Text(){
            Span('12 ').fontSize(17)
            Span('4月').fontSize(10)
          }.margin({right: 6, top: -2}).fontColor('#CAC0E0').flexShrink(0)
          Column(){
            // RichText(item.user_title)
            Text(item.user_title).margin({bottom: 8}).font({size: 14, weight: 400}).fontColor('#CAC0E0')
            Grid(){
              ForEach(item.imageList, (uri: Resource | undefined) => {
                GridItem(){
                  Image(uri).width(this.ImageSize).height(this.ImageSize).borderRadius(6)
                }
              })
            }.rowsGap(9).columnsGap(9).columnsTemplate('1fr 1fr 1fr')
          }.alignItems(HorizontalAlign.Start)
        }.margin({bottom: 30})
      })
    }
  }
}