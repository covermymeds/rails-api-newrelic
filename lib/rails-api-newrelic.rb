require "rails-api-newrelic/version"

require "new_relic/agent/instrumentation/rails3/action_controller"
require "new_relic/agent/instrumentation/rails3/errors"

class ActionController::API

  include NewRelic::Agent::Instrumentation::ControllerInstrumentation
  include NewRelic::Agent::Instrumentation::Rails3::ActionController
  include NewRelic::Agent::Instrumentation::Rails3::Errors

end
