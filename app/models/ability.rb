class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :manage, Product
    cannot :destroy, Comment
    if user.admin?  # additional permissions for administrators
        can :manage, :all
    end
  end
end
