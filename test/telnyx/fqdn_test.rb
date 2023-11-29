# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class FQDNTest < Test::Unit::TestCase
    should "list fqdns" do
      fqdn = FQDN.list
      assert_requested :get, "#{Telnyx.api_base}/fqdns"
      assert_kind_of ListObject, fqdn
      assert_kind_of FQDN, fqdn.first
    end

    should "create fqdn" do
      FQDN.create fqdn: "example.com", dns_record_type: "A", connection_id: "abc"
      assert_requested :post, "#{Telnyx.api_base}/fqdns"
    end

    should "retrieve fqdn" do
      # assert_requested :get, "#{Telnyx.api_base}/fqdns/veniam%20labore"
      fqdn = FQDN.retrieve("veniam%20labore")
      assert_kind_of FQDN, fqdn
    end

    should "delete fqdn" do
      fqdn = FQDN.retrieve("veniam%20labore")
      fqdn.delete
      assert_requested :delete, "#{Telnyx.api_base}/fqdns/#{fqdn.id}"
    end

    should "update fqdn" do
      fqdn = FQDN.retrieve("veniam%20labore")

      fqdn.fqdn = "example.com"
      fqdn.save
      assert_requested :patch, "#{Telnyx.api_base}/fqdns/#{fqdn.id}"
    end
  end
end
