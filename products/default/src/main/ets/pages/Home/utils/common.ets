
import { HomeNavListType } from '../types/HomeType'
export default class HomeCommonData {


  static readonly home_nav_list: Array<HomeNavListType> = [
    {
      uri: $r('app.media.home_select'),
      title: '地图'
    },
    {
      uri: $r('app.media.home_select'),
      title: '活动'
    },
    {
      uri: $r('app.media.home_select'),
      title: '预定'
    },
    {
      uri: $r('app.media.home_select'),
      title: '客服'
    },
  ]
}
