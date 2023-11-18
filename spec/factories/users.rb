FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd12'}
    password_confirmation {password}
    last_name             {'test_last_name'}
    first_name            {'test_first_name'}
    last_name_kana        {'test_last_name_kana'}
    first_name_kana       {'test_first_name_kana'}
    birth_date            {'1942-08-16'}
  end
end