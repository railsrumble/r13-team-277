class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories
  has_many :tasks, :through => :categories

  def tasks(params)
    return Task.where(user_id: self.id, category_id: params[:category]) if params[:category]
    return Task.where(user_id: self.id, type: params[:type]) if params[:type]
    return Task.where(user_id: self.id, priority: params[:priority]) if params[:priority]
  end
end
