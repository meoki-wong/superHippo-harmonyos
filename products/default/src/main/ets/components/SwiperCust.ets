@Component
export default struct SwiperCust {
  @Prop itemList: Resource[] = []
  @State headIndex: number = 0
  @State changeIndex: boolean = false
  @State changePath: number = 0
  setWidthValue = (index: number) => {
    let List = [255.06, 206.37, 169.7]
    return List[index]
  }
  setHeightValue = (index: number) => {
    let List = [340, 292, 255]
    return List[index]
  }
  handlePanGesture = (offsetX: number) => {
    this.changeIndex = true
    this.startAnimation(offsetX)
  }
  startAnimation = (offsetX: number) => {
    let _this = this
    animateTo({ duration: 300 }, () => {
      _this.changePath = offsetX
    })
  }
  changeItemPosition = () => {
    let firstElement: Resource = this.itemList.shift() as Resource;
    animateTo({duration: 300}, () => {
      this.itemList.push(firstElement)
    })
  }

  build() {
    Stack() {
      ForEach(this.itemList, (item: Resource, index: number) => {
        Row() {
          Image(item)
            .objectFit(ImageFit.Cover)
            .interpolation(ImageInterpolation.High)
        }
        .offset({
          x: this.headIndex === index && !this.changeIndex ? 0 :
            this.changeIndex && this.headIndex == index ? this.changePath : 53 * index,
          y: 0
        })
        .zIndex(10 - index)
        .width(this.setWidthValue(index))
        .height(this.setHeightValue(index))
        .blur(10 * index)
      })
    }
    .alignContent(Alignment.Top)
    .gesture(PanGesture({ direction: PanDirection.Horizontal }).onActionStart((event: GestureEvent) => {
      this.changePath = event.offsetX
      this.handlePanGesture(event.offsetX)
    }).onActionUpdate((event: GestureEvent) => {
      this.handlePanGesture(event.offsetX)
    }).onActionEnd(() => {
      this.changeIndex = false
      this.changeItemPosition()
    }))

  }
}
