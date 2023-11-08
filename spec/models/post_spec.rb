require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規商品の出品' do
    context '新規出品ができるとき' do
      it '全項目があれば出品できる' do
        expect(@post).to be_valid
      end
    end

    context '新規出品ができない時' do
      it 'titleがないと出品できない' do
        @post.title = ' '
        @post.valid?
        expect(@post.errors.full_messages).to include include("Title can't be blank")
      end
      it 'textがないと出品できない' do
        @post.text = ' '
        @post.valid?
        expect(@post.errors.full_messages).to include include("Text can't be blank")
      end
      it 'category_idがないと出品できない' do
        @post.category_id = ' '
        @post.valid?
        expect(@post.errors.full_messages).to include include("Category can't be blank")
      end
      it 'prefecture_idの情報がないと出品できない' do
        @post.prefecture_id = ' '
        @post.valid?
        expect(@post.errors.full_messages).to include include("Prefecture can't be blank")
      end
      it 'category_idで1が選択されていると登録できない' do
        @post.category_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include include("Category can't be blank")
      end
      it 'prefecture_idで1が選択されていると登録できない' do
        @post.prefecture_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include include("Prefecture can't be blank")
      end
    end
  end
end
