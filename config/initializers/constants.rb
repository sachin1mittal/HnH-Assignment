constants ||= JSON.parse(File.read(Rails.root.to_s + '/config.json'))[Rails.env]

DATABASE_USERNAME ||= constants['database_username']
DATABASE_PASSWORD ||= constants['database_password']
