require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def product_with_offers
    product = Product.create!(title: 'Test Product')
    product.offers.create!(legitimate: true, amount: 23.0)
    product.offers.create!(amount: 12.0)
    product.offers.create!(amount: 40.0)
    product
  end

  test "includes offers" do
    product_with_offers

    product = Product.includes(:offers).first
    assert_equal 3, product.offers.count
  end

  test "preload scope" do # does not work
    product_with_offers

    product = Product.preload(:legitimate_offers).first
    assert_equal 1, product.legitimate_offers.count
  end

  test "includes scope" do # does not work
    product_with_offers

    product = Product.includes(:legitimate_offers).first
    assert_equal 1, product.legitimate_offers.count
  end

  test "eager_load scope" do # does not work
    product_with_offers

    product = Product.eager_load(:legitimate_offers).first
    assert_equal 1, product.legitimate_offers.count
  end
end
