puts 'Creating Admin...'
a = Admin.create! \
  email:    'info@ramin0.raye7.com',
  password: 'Raye7@123'
puts '- Email   : ' << a.email
puts '- Password: ' << a.password
