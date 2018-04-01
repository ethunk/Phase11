class CategorySeeder
  CATEGORIES = ["Mexican", "Italian", "American", "Chinese"]

  def self.seed!
    CATEGORIES.each do |category|
      test = Category.find_or_initialize_by(name: category)
      test.save!
    end
  end

end
