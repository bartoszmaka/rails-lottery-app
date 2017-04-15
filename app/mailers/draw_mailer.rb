class DrawMailer < ApplicationMailer
  def draw_won(item)
    @user = item.winner
    @item = item
    mail(to: @user.email, subject: 'You just won draw!')
  end
end
