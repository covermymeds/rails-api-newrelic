module RailsAPINewrelic

  AFTER_INITIALIZER_3 = lambda do |app|

    require "new_relic/agent/instrumentation/rails3/action_controller"
    require "new_relic/agent/instrumentation/rails3/errors"

    class ActionController::API
      include NewRelic::Agent::Instrumentation::ControllerInstrumentation
      include NewRelic::Agent::Instrumentation::Rails3::ActionController
      include NewRelic::Agent::Instrumentation::Rails3::Errors
    end

  end

  AFTER_INITIALIZER_4 = lambda do |app|

    require "new_relic/agent/instrumentation/rails4/action_controller"
    require "new_relic/agent/instrumentation/rails4/errors"

    class ActionController::API
      include NewRelic::Agent::Instrumentation::ControllerInstrumentation
      include NewRelic::Agent::Instrumentation::Rails4::ActionController
      include NewRelic::Agent::Instrumentation::Rails4::Errors
    end

  end

  class Engine < ::Rails::Engine

    if ::Rails::VERSION::MAJOR.to_i == 4
      initializer "finisher_hook", &AFTER_INITIALIZER_4
    elsif ::Rails::VERSION::MAJOR.to_i == 3
      initializer "finisher_hook", &AFTER_INITIALIZER_3
    end

  end
end
