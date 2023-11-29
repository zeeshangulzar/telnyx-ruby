# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class IPTest < Test::Unit::TestCase
    should "list ips" do
      ip = IP.list
      assert_requested :get, "#{Telnyx.api_base}/ips"
      assert_kind_of ListObject, ip
      assert_kind_of IP, ip.first
    end

    should "create ip" do
      IP.create ip_address: "0.0.0.0"
      assert_requested :post, "#{Telnyx.api_base}/ips"
    end

    should "retrieve ip" do
      ip = IP.retrieve("f2b67e12-afd0-7772-1e5a-c8bacc02f107")
      # assert_requested :get, "#{Telnyx.api_base}/ips/#{ip.id}"
      assert_kind_of IP, ip
    end

    should "delete ip" do
      ip = IP.retrieve("f2b67e12-afd0-7772-1e5a-c8bacc02f107")

      ip.delete
      assert_requested :delete, "#{Telnyx.api_base}/ips/#{ip.id}"
    end

    should "update ip" do
      ip = IP.retrieve("f2b67e12-afd0-7772-1e5a-c8bacc02f107")

      ip.ip_address = "0.0.0.0"
      ip.save
      assert_requested :patch, "#{Telnyx.api_base}/ips/#{ip.id}"
    end
  end
end
