# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class FQDNConnectionTest < Test::Unit::TestCase
    should "list fqdn connections" do
      fqdn_connections = FQDNConnection.list
      assert_requested :get, "#{Telnyx.api_base}/fqdn_connections"
      assert_kind_of ListObject, fqdn_connections
      assert_kind_of FQDNConnection, fqdn_connections.first
    end

    should "create fqdn connection" do
      FQDNConnection.create(connection_name: "test")
      assert_requested :post, "#{Telnyx.api_base}/fqdn_connections"
    end

    should "retrieve fqdn connection" do
      fqdn_connection = FQDNConnection.retrieve("voluptate")
      assert_requested :get, "#{Telnyx.api_base}/fqdn_connections/voluptate"
      assert_kind_of FQDNConnection, fqdn_connection
    end

    should "delete fqdn connection" do
      fqdn_connection = FQDNConnection.retrieve("voluptate")

      fqdn_connection.delete
      assert_requested :delete, "#{Telnyx.api_base}/fqdn_connections/1293384261075731499"
    end

    should "update fqdn connection" do
      fqdn_connection = FQDNConnection.retrieve("voluptate")

      fqdn_connection.active = false
      fqdn_connection.save
      assert_requested :patch, "#{Telnyx.api_base}/fqdn_connections/1293384261075731499"
    end
  end
end
