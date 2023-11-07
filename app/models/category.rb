class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '相談' },
    { id: 3, name: '情報共有' },
    { id: 4, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end