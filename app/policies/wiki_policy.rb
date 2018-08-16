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
      @user.role == "premium" || @user.role == "admin"
    else
      true
    end
  end

  def new?
    create?
  end

  def update?
    if @user.role == "premium" || @user.role == "admin"
      true
    else
      !@record.private? && !@record.changed.include?("private")
    end
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end
