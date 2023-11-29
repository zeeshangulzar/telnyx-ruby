# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class TelnyxNumberOrderTest < Test::Unit::TestCase
    should "be listable" do
      number_orders = Telnyx::NumberOrder.list
      assert_requested :get, "#{Telnyx.api_base}/number_orders"
      assert_kind_of Telnyx::ListObject, number_orders
      assert_kind_of Telnyx::NumberOrder, number_orders.first
    end

    should "be creatable" do
      Telnyx::NumberOrder.create(
        phone_numbers: [
          { "phone_number" => "+12223334444", "regulatory_requirements" => [] },
        ],
        customer_reference: "MY REF 001",
        connection_id: "442191469269222625"
      )
      assert_requested :post, "#{Telnyx.api_base}/number_orders"
    end

    should "be retrievable" do
      number_order = Telnyx::NumberOrder.retrieve "sequi"
      # assert_requested :get, "#{Telnyx.api_base}/sequi/number_orders/#{number_order.id}"
      assert_kind_of Telnyx::NumberOrder, number_order
    end

    should "be savable" do
      number_order = Telnyx::NumberOrder.retrieve "sequi"
      number_order.customer_reference = "foobar"
      number_order.save
      assert_requested :patch, "#{Telnyx.api_base}/number_orders/#{number_order.id}"
      assert_kind_of Telnyx::NumberOrder, number_order
    end
  end
end
