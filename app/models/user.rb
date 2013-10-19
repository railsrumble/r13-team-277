class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories, :dependent => :destroy
  has_many :tasks, :order => :priority, :through => :categories, :dependent => :destroy

  validates :name, :presence => true

  def tasks(params={})
    return Task.where(user: self, category_id: params[:category]) if params[:category]
    return Task.where(user: self, type: params[:type]) if params[:type]
    return Task.where(user: self, priority: params[:priority]) if params[:priority]
    return Task.where(user: self)
  end
end
