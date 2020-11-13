class PurchasesController < ApplicationController
  def index
    @purchase_profiles = current_user.purchase_profiles
  end

  def create
    purchase = Purchase.new
    purchase.user_id = current_user.id
    purchase.profile_id = params[:profile_id]

    if purchase.save
      redirect_to profiles_path, success: '購入が完了しました'
    else
      redirect_to profiles_path, danger: '購入に失敗しました'
    end
  end
end
