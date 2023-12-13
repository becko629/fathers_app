require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment, user_id: user.id, post_id: post.id)
end

  context 'コメント投稿ができるとき' do
    it 'コメントがあれば登録できる' do
      expect(@comment).to be_valid
    end
    it 'commentは、30文字以内であれば登録できる' do
      expect(@comment).to be_valid
    end
  end

  context 'コメントができない時' do
    it 'commentがないとコメントできない' do
      @comment.comment_text = ' '
      @comment.valid?
      expect(@comment.errors.full_messages).to include include("Comment text can't be blank")
    end
    it 'commentは150文字以上ではコメントできない' do
      @comment.comment_text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      @comment.valid?
      expect(@comment.errors.full_messages).to include include("Comment text is too long (maximum is 150 characters)")
    end
  end
end
end
