FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd12'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_date            {'1942-08-16'}
  end
end