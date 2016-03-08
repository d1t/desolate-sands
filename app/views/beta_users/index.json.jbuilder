json.array!(@beta_users) do |beta_user|
  json.extract! beta_user, :id
  json.url beta_user_url(beta_user, format: :json)
end
