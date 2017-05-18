class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new 
    if user.has_role? :admin
    can :manage, :all
    elsif user.has_role? :moder
    can :read, :all
    can :delete, :all
    else
    can :read, :all
    can :new, :all
    can :create, :all
    can :manage, Content, user_id: user.id
    end
    
  end
end
