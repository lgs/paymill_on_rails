require "paymill"

module PaymillOnRails
  class Engine < ::Rails::Engine
    isolate_namespace PaymillOnRails
  end
end
