class WikiPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    if @record.private?
      @user.role == "premium"
    else
      true
    end
  end

  def new?
    create?
  end

  def update?
    !@record.private?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end
