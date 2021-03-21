class ApplicationController < ActionController::Base
#  以下、BASIC認証コード。他の機能を実装後にコメントアウト解除予定。ローカル環境での実装確認済み。
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  # 以上、BASIC認証コード。


end
