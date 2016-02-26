1.upto(100) do |i|
  role = %w{ user admin }.sample
  active = [ true, false ].sample
  User.create(email: "example#{i}@ex.com", password: '00000000', active: active, role: role)
end
