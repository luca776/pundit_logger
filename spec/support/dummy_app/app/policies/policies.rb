class WidgetPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if @user.first_name == 'Peter'
        @scope.all
      else
        @scope.none
      end
    end
  end

  def initialize(user, widget)
    @user = user
    @widget = widget
  end

  def show?
    @user.first_name == 'Peter'
  end
end