# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class IPConnectionTest < Test::Unit::TestCase
    should "list ip connections" do
      ip_connections = IPConnection.list
      assert_requested :get, "#{Telnyx.api_base}/ip_connections"
      assert_kind_of ListObject, ip_connections
      assert_kind_of IPConnection, ip_connections.first
    end

    should "create ip connection" do
      IPConnection.create
      assert_requested :post, "#{Telnyx.api_base}/ip_connections"
    end

    should "retrieve ip connection" do
      ip_connection = IPConnection.retrieve("molestias")
      # assert_requested :get, "#{Telnyx.api_base}/ip_connections/#{ip_connection.id}"
      assert_kind_of IPConnection, ip_connection
    end

    should "delete ip connection" do
      ip_connection = IPConnection.retrieve("molestias")

      ip_connection.delete
      assert_requested :delete, "#{Telnyx.api_base}/ip_connections/#{ip_connection.id}"
    end

    should "update ip connection" do
      ip_connection = IPConnection.retrieve("molestias")

      ip_connection.active = false
      ip_connection.save
      assert_requested :patch, "#{Telnyx.api_base}/ip_connections/#{ip_connection.id}"
    end
  end
end
