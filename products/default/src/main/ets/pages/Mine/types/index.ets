





export interface  CardDataStatisticsType {
  title: string
  value: string
}

export interface BalanceCardShowListItemType {
  uri: Resource,
  title: string
}

export interface DynamicListItemType {
  id: number | string,
  title: string

}



export interface MoodListTypeItem {
  time: string
  user_title: string
  imageList: Array<Resource>
}
