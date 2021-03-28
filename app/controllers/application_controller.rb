class ApplicationController < ActionController::Base
  #  以下、BASIC認証コード。他の機能を実装後にコメントアウト解除予定。WEB環境での実装確認済み。
  # before_action :basic_auth

  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
  #   end
  # end

  # 以上、BASIC認証コード。
  
  before_action :authenticate_user!,except: [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end
end
