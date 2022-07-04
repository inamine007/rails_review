module ApplicationHelper
  # コントローラーに対応するものしか読み込ませたいない場合の設定
  class Application < Rails::Application
    config.action_controller.include_all_helpers = false #これをセット！！
  end
end
