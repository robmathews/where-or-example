require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  def product_with_offers
    product = Product.create!(title: 'Test Product')
    product.offers.create!(legitimate: true, amount: 23.0)
    product.offers.create!(amount: 12.0)
    product.offers.create!(amount: 40.0)
    product
  end

  test "t" do # works
    product_with_offers

    assert Offer.includes(:product).first
  end

  test "preloads product scope" do # does not work
    product_with_offers

    assert Offer.preload(:available_product).first
  end

  test "includes product scope" do # does not work
    product_with_offers

    assert Offer.includes(:available_product).first
  end

  test "eager_loads scope" do # works
    product_with_offers

    assert Offer.eager_load(:available_product).first
  end

end
