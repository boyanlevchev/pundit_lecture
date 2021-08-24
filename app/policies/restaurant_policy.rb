class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   true
  # end
  #
  # new? is handled by create?

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # Only user who created restaurant can edit
  #   # otherwise => false
  #   # if @user == @record.user
  #   #   true
  #   # else
  #   #   false
  #   # end
  #   user == record.user
  # end
  #
  # edit? is handled by update?

  def update?
    # if @user == @record.user
    #   true
    # else
    #   false
    # end

    # refactored to use user_permitted? method
    user_permitted?
  end

  def destroy?
    user_permitted?
  end

  private

  def user_permitted?
    # user is permitted if they own the record
    # OR if they are an admin
    user == record.user || user.admin
  end
end
