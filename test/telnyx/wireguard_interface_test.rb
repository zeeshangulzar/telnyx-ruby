# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class WireguardInterfaceTest < Test::Unit::TestCase
    # should "be creatable" do
    #   wireguard_interface = Telnyx::WireguardInterface.create(network_id: Telnyx::Network.list().first.id, name: "testing", region_code: "dallas-tx")
    #   assert_requested :post, "#{Telnyx.api_base}/v2/wireguard_interfaces"
    #   assert wireguard_interface.is_a?(Telnyx::WireguardInterface)
    # end

    # should "be listable" do
    #   wireguard_interfaces = Telnyx::WireguardInterface.list
    #   assert_requested :get, "#{Telnyx.api_base}/v2/wireguard_interfaces"
    #   assert wireguard_interfaces.data.is_a?(Array)
    #   assert wireguard_interfaces.first.is_a?(Telnyx::WireguardInterface)
    # end

    # should "be retrievable" do
    #   exsisting_id = Telnyx::WireguardInterface.list.first.id
    #   wireguard_interface = Telnyx::WireguardInterface.retrieve(exsisting_id)
    #   assert_requested :get, "#{Telnyx.api_base}/v2/wireguard_interfaces/#{exsisting_id}"
    #   assert wireguard_interface.is_a?(Telnyx::WireguardInterface)
    # end

    # should "be updatable" do
    #   exsisting_id = Telnyx::WireguardInterface.list.first.id
    #   stub = stub_request(:patch, "#{Telnyx.api_base}/v2/wireguard_interfaces/#{exsisting_id}")
    #          .with(body: hash_including(name: "foo"))
    #          .to_return(body: JSON.generate(data: WireguardInterface.retrieve(exsisting_id)))
    #   wireguard_interface = Telnyx::WireguardInterface.update(exsisting_id, name: "foo1")
    #   assert_requested stub
    #   assert wireguard_interface.is_a?(Telnyx::WireguardInterface)
    # end

    # should "be deletable" do
    #   messaging_network = Telnyx::WireguardInterface.list.first
    #   messaging_network = messaging_network.delete
    #   assert_requested :delete, "#{Telnyx.api_base}/v2/wireguard_interfaces/#{messaging_network.id}"
    #   assert messaging_network.is_a?(Telnyx::WireguardInterface)
    # end
  end
end
