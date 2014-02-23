class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member
        can :manage, Wiki, :user_id => user.id
        can :manage, Wiki, :collaborators => { :user_id => user.id }
        can :read, Wiki
    end

    if user.role? :premium_member
        can :manage, Wiki, :user_id => user.id
        can :read, Wiki
    end

    if user.role? :moderator
        can :destroy, Wiki
    end

    if user.role? :admin
        can :manage, :all
    end

    can :read, Wiki, public: true
  end
end
