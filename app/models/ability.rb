class Ability
  include CanCanNamespace::Ability

  def initialize(user)
    can [:index, :show, :new], Game
    can [:create, :edit, :update, :destroy], Game, user: user
  end
end
