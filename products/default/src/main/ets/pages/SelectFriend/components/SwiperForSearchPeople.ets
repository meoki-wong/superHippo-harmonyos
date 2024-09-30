import { StrangePersonList } from '../utils/MockData'
import { StrangePersonType } from '../types'

@Component
export default struct SwiperForSearchPeople {
  setWidthValue = (index: number) => {
    let list = [340, 323, 306]
    return list[index] || 0
  }
  setHeightValue = (index: number) => {
    let list = [588, 182, 193]
    return list[index] || 0

  }

  build() {
    Stack() {
      ForEach(StrangePersonList, (item: StrangePersonType, index: number) => {
        Column() {
          Image(item.uri).width(this.setWidthValue(index)).height(this.setHeightValue(index)).borderRadius(12)
        }.zIndex(10 - index).offset({
          x: 0,
          y: index * 50
        }).width('100%')
      })
    }
  }
}