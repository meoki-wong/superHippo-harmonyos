/*
 *
 * */
export interface StrangePersonType {
  uri: Resource | undefined
  name: string
  distance: number | string
  address: string | undefined
  gender: number
  constellation: string | undefined
  bodyHeight: number
  age: number,
  isGone?: boolean
}

export interface feedBackItemListType {
  id: number,
  title: string,
  desc: string
}