require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'student_factoryが有効であること' do
    expect(build(:student)).to be_valid
  end

  describe 'validates presence' do
    context 'emailを指定していないとき' do
      let(:student) { build(:student, email: nil) }

      it '無効である' do
        student.valid?
        expect(student.errors.messages[:email]).to include("can't be blank")
      end
    end

    context 'addressを指定していないとき' do
      let(:student) { build(:student, address: nil) }

      it '無効である' do
        student.valid?
        expect(student.errors.messages[:address]).to include("can't be blank")
      end
    end

    context 'phone_numberを指定していないとき' do
      let(:student) { build(:student, phone_number: nil) }

      it '無効である' do
        student.valid?
        expect(student.errors.messages[:phone_number]).to include("can't be blank")
      end
    end
  end

  describe 'validates length' do
    context '氏名が31文字以上である場合' do
      let(:student) { build(:student, name: 'a' * 31) }

      it '無効である' do
        student.valid?
        expect(student.errors.messages[:name]).to include('is too long (maximum is 30 characters)')
      end
    end

    context '電話番号が5文字以下の場合' do
      let(:student) { build(:student, phone_number: 'a' * 5) }

      it '無効である' do
        student.valid?
        expect(student.errors.messages[:phone_number]).to include('is too short (minimum is 6 characters)')
      end
    end

    context '電話番号が13文字以上の場合' do
      let(:student) { build(:student, phone_number: 'a' * 13) }
      it '無効である' do
        student.valid?
        expect(student.errors.messages[:phone_number]).to include('is too long (maximum is 12 characters)')
      end
    end
  end

  describe 'validate must_be_join_date_before_than_withdrawal_date' do
    context '退会日が入会日よりも前の場合' do
      let(:student) { build(:student, withdrawal_date: Time.zone.yesterday) }

      it '無効である' do
        student.valid?
        expect(student).not_to be_valid
      end
    end
  end
end
