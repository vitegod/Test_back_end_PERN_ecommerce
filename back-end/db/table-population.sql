-- Create categories
INSERT INTO categories(name, description, url_slug)
VALUES
  ('Entertainment', 'A variety of products for your entertainment needs.', 'entertainment'),
  ('Books', 'A selection of books across various genres.', 'books'),
  ('Movies', 'A collection of popular movies to enjoy.', 'movies');

-- Insert sample products with temporary data
WITH product_row AS (
  INSERT INTO
    products(
      name,
      price,
      stock_count,
      available_stock_count,
      short_description,
      long_description,
      avg_rating,
      rating_count
    )
  VALUES
    (
      'Sample Product 1',
      10.99,
      10,
      10,
      'This is a sample product description.',
      'This is a sample long description for the product.',
      0.00,
      0
    )
  RETURNING id
)
-- Insert product categories using product_row
INSERT INTO product_categories(product_id, category_id)
VALUES
  ((SELECT id FROM product_row), 1),
  ((SELECT id FROM product_row), 2);
