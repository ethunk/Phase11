class CategorizationSeeder

  @restaurants = Restaurant.all.to_a
  @categories = Category.all.to_a

  def self.seed!
    if Categorization.all.count == 0
      @restaurants.each do |restaurant|
        Categorization.create(
          restaurant_id: restaurant.id,
          category_id: @categories.sample.id
        )
      end
    end
  end
end
