module RailsAPINewrelic

  AFTER_INITIALIZER = lambda do |app|

    require "new_relic/agent/instrumentation/rails3/action_controller"
    require "new_relic/agent/instrumentation/rails3/errors"

    class ActionController::API

      include NewRelic::Agent::Instrumentation::ControllerInstrumentation
      include NewRelic::Agent::Instrumentation::Rails3::ActionController
      include NewRelic::Agent::Instrumentation::Rails3::Errors

    end

  end

  class Engine < ::Rails::Engine

    initializer "finisher_hook", &AFTER_INITIALIZER

  end

end
