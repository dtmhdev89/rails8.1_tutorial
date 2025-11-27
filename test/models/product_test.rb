require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "send email notifications when back in stock" do
    product = products(:tshirt)

    product.update(inventory_count: 0)

    assert_emails 1 do
      product.update(inventory_count: 99)
    end
  end
end
