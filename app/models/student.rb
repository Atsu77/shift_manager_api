# frozen_string_literal: true

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, :email, :address, :phone_number, presence: true
  validates :name, length: { maximum: 30 }
  validates :phone_number, length: { in: 6..12 }
  validate :must_be_join_date_before_than_withdrawal_date

  def must_be_join_date_before_than_withdrawal_date
    if withdrawal_date.present? && join_date > withdrawal_date
      errors.add(:withdrawal_date, '入会日よりも前の日付は登録できません')
    end
  end
end
