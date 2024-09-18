
import { CardDataStatisticsType, BalanceCardShowListItemType, DynamicListItemType } from '../types'
export default class MineCommonData {


  static readonly CardDataStatistics: Array<CardDataStatisticsType> = [
    {
      title: '喜欢我',
      value: '1236'
    },
    {
      title: '我喜欢',
      value: '9382'
    },
    {
      title: '看过我',
      value: '43'
    }
  ]

  static readonly BalanceCardShowList: Array<BalanceCardShowListItemType> = [
    {
      uri: $r('app.media.mine_money_icon'),
      title: '储值送礼金'
    },
    {
      uri: $r('app.media.mine_score_icon'),
      title: '消费返积分'
    },
    {
      uri: $r('app.media.mine_vip_icon'),
      title: '2w+会员'
    },
  ]

  static readonly DynamicList: Array<DynamicListItemType> = [
    {
      id: 1,
      title: '我的动态'
    },
    {
      id: 2,
      title: '优选活动'
    },
  ]
}