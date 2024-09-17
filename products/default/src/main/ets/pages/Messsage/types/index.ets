


export interface FriendListType {
  uri: Resource
  desc: string
  needCloud?: boolean
}

export interface ChatListItemType {
  uri: Resource
  nickname: string
  time: string
  lastMsg: string | undefined | null
  needCloud?: boolean
  online: boolean
}