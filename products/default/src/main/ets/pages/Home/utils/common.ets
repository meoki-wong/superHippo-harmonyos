
import { HomeNavListType, UserOptionsType, ProductTabsType } from '../types/HomeType'
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


  static readonly User_option_list: Array<UserOptionsType> = [
    {
      uri: $r('app.media.home_select'),
      title_en: 'Table Booking',
      title_ch: '在线订卡',
    },
    {
      uri: $r('app.media.home_select'),
      title_en: 'Take a Drink',
      title_ch: '约酒组局'
    },
  ]

  static readonly Home_calendar_list: Array<UserOptionsType> = [
    {
      uri: $r('app.media.home_calendar'),
      title_en: 'Events Calendar',
      title_ch: '品牌活动日历',
    },
  ]

  /**
   * 首页产品筛选tab
   */

  static readonly product_tabs_list: Array<ProductTabsType> = [
    {
      title: '全部'
    },
    {
      title: '兔子洞',
      fir_floor: 'B1',
      sec_floor: 'LG'
    },
    {
      title: '漫步',
      fir_floor: 'G'
    },
    {
      title: '人间',
      fir_floor: 'L1',
      sec_floor: 'L2'
    },
    {
      title: '极乐',
      fir_floor: 'L3',
      sec_floor: 'L4'
    },
    {
      title: '仙境',
      fir_floor: 'L5',
      sec_floor: 'L6'
    }
  ]
}
