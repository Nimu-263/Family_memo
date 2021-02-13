class MemosController < ApplicationController
  before_action :move_to_registration

  def create
    memo = Memo.create(memo_params)
    render json:{ memo: memo }
  end

  def checked
    memo = Memo.find(params[:id])
    if memo.checked 
      memo.update(checked: false)
    else
      memo.update(checked: true)
    end

    item = Memo.find(params[:id])
    render json: { memo: item }
  end

  private

  def memo_params
    params.permit(:title, :content).merge(user_id: current_user.id, checked: false)
  end

  def move_to_registration
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end

end
