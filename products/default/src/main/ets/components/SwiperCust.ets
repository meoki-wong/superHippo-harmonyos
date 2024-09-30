@Component
export default struct SwiperCust {
  @Prop itemList: Resource[] = []
  @State headIndex: number = 0
  @State changeIndex: boolean = false
  @State changePath: number = 0
  // 处理尺寸逻辑
  handleSizeList = (arr: Array<number>) => {
    for (let i = 0; i < this.headIndex; i++) {
      const element = arr.pop() as number;
      // 将取出的元素插入到数组的开始位置
      arr.unshift(element);
    }
    return arr
  }
  setWidthValue = (index: number) => {
    let list = [300.06, 230.37, 190.7]
    let resList = this.handleSizeList(list)[index]
    return resList
  }
  setHeightValue = (index: number) => {
    let list = [340, 292, 255]
    let resList = this.handleSizeList(list)[index]
    return resList
  }
  setZIndex = (index: number) => {
    let zIndex = this.headIndex <= index ? this.itemList.length - index : 0 - this.itemList.length - index - 1
    return zIndex
  }
  setOffsetWidth = (index: number) => {
    return this.headIndex === index && !this.changeIndex ? 0 :
      this.changeIndex && this.headIndex == index ? this.changePath : 53 * this.handleSizeList([0, 1, 2])[index]
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
    animateTo({ duration: 300 }, () => {
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
        .visibility(index <= 2 ? Visibility.Visible : Visibility.None)
        .offset({
          x: this.setOffsetWidth(index),
          y: 0
        })
        .zIndex(this.setZIndex(index))
        .width(this.setWidthValue(index))
        .height(this.setHeightValue(index))
        .blur(10 * Math.abs(this.headIndex - index))
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
      this.headIndex = this.headIndex == 2 ? 0 : this.headIndex + 1
      console.log('触发参数', this.headIndex)
      // this.changeItemPosition()
    }))

  }
}
