require 'faker'

class RestaurantSeeder
  @restaurants = [
    { :user_id=>2,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>3,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>4,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>5,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>6,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>7,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    },
    { :user_id=>8,
      address: Faker::Address.street_address,
      name: Faker::Commerce.product_name,
      :city=> Faker::Address.city,
      :state=> Faker::Address.state_abbr,
      :zip=> Faker::Address.zip_code,
      description: Faker::Lorem.sentence
    }
  ]

  def self.seed!
    @restaurants.each do |restaurant_params|
      name = restaurant_params[:name]
      restaurant = Restaurant.find_or_initialize_by(name: name)
      restaurant.assign_attributes(restaurant_params)
      restaurant.save!
    end
  end

end
