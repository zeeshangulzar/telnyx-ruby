# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class BillingGroupTest < Test::Unit::TestCase
    should "list billing groups" do
      billing_groups = BillingGroup.list
      assert_requested :get, "#{Telnyx.api_base}/billing_groups"
      assert_kind_of ListObject, billing_groups
      assert_kind_of BillingGroup, billing_groups.first
    end

    should "create billing group" do
      BillingGroup.create
      assert_requested :post, "#{Telnyx.api_base}/billing_groups"
    end

    should "retrieve billing group" do
      billing_group = BillingGroup.retrieve("216cd20c-8d77-5b7a-cda8-a7080b3b7abc")
      assert_requested :get, "#{Telnyx.api_base}/billing_groups/216cd20c-8d77-5b7a-cda8-a7080b3b7abc"
      assert_kind_of BillingGroup, billing_group
    end

    should "delete billing group" do
      billing_group = BillingGroup.retrieve("2154bf97-7bce-3855-b5ec-1f6dd64882e1")

      billing_group.delete
      assert_requested :delete, "#{Telnyx.api_base}/billing_groups/f5586561-8ff0-4291-a0ac-84fe544797bd"
    end

    should "update billing group" do
      billing_group = BillingGroup.retrieve("216cd20c-8d77-5b7a-cda8-a7080b3b7abc")

      billing_group.active = false
      billing_group.save
      assert_requested :patch, "#{Telnyx.api_base}/billing_groups/f5586561-8ff0-4291-a0ac-84fe544797bd"
    end
  end
end
