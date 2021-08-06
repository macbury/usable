# frozen_string_literal: true

require 'forwardable'
require_relative "usable/version"
require_relative "usable/service"
require_relative "usable/service_failure"

# Give ability to included class to use Service objects as method
# use Service, as: :mapped_method
module Usable
  include Forwardable

  def use(service_class, as: nil)
    as ||= service_class.to_s.demodulize.underscore

    def_delegator service_class, :call, as
  end
end
