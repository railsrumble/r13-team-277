class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories, :dependent => :destroy
  has_many :tasks, :through => :categories, :dependent => :destroy

  validates :email, :presence => true

  def tasks(params={})
    conditions = {:user => self}
    conditions[:category] = params[:category] if params[:category]
    conditions[:task_type] = params[:task_type] if params[:task_type]
    conditions[:priority] = params[:priority] if params[:priority]

    return Task.where(conditions)
  end
end
