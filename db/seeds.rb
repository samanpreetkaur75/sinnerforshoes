require 'csv'
require 'open-uri'

# Seed data from CSV file
def seed_from_csv(file_path)
  puts "Seeding from CSV file: #{file_path}..."

  CSV.foreach(file_path, headers: true) do |row|
    # Find or create the category
    category = Category.find_or_create_by(name: row['category'])

    # Create the product
    product = Product.create(
      name: row['name'],
      category: category,
      description: row['description'],
      price: row['price'].to_f,
      stock_quantity: row['stock_quantity'].to_i,
      brand: row['brand']
    )

    # Attach the image if URL is present
    if row['image_url'].present?
      attach_image_from_url(product, row['image_url'])
    end

    puts "Created product: #{product.name} with image #{row['image_url']}"
  end
end

# Helper method to download and attach an image from a URL
def attach_image_from_url(product, image_url)
  begin
    image = URI.open(image_url)
    product.image.attach(io: image, filename: File.basename(image_url))
    puts "Attached image: #{image_url}"
  rescue => e
    puts "Error attaching image from URL: #{image_url} - #{e.message}"
  end
end

# Main seeding logic
def seed_database
  csv_file_path = Rails.root.join('db', 'shoes.csv') # Adjust the path as needed

  if File.exist?(csv_file_path)
    seed_from_csv(csv_file_path)
    puts "Seeding completed successfully!"
  else
    puts "Error: CSV file not found at #{csv_file_path}. Please ensure the file exists."
  end
end

# Run the seeding process
seed_database
