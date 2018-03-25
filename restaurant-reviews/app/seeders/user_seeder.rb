
class UserSeeder
@users = [
  {
    :email=>"jerod_goyette@armstrongbeahan.info",
    :password=>"y218et"
  }, {
    :email=>"janna_goyette@armstrongbeahan.info",
    :password=>"y218dt"
  }, {
    :email=>"dana_goyette@armstrongbeahan.info",
    :password=>"k218dt"
  }, {
    :email=>"anna_daogette@armstrongbeahan.info",
    :password=>"yf248dt"
    }
  ]

  def self.seed!
    @users.each do |user_params|
      email = user_params[:email]
      user = User.find_or_initialize_by(email: email)
      user.assign_attributes(user_params)
      user.save!
    end
  end

end
