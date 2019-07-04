require 'pundit'
require 'set'

module ::Pundit
  class PolicyFinder
    alias_method :original_scope, :scope
    def scope
      policy_scope_class = original_scope
      policy_scope_class_invoked policy_scope_class
      policy_scope_class
    end

    private

    def policy_scope_class_invoked(policy_scope_class)
      return unless policy_scope_class
      Pundit.invoked_policy_scope_names << policy_scope_class.name

      return unless Pundit::Logger.log_scope_instantiation?
      Pundit::Logger.log "Invoking #{policy_scope_class.name}"
    end
  end

  class << self
    def invoked_policy_scope_names
      @invoked_policy_scope_names ||= Set.new
      @invoked_policy_scope_names
    end
  end
end
