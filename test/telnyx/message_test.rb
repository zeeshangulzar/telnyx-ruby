# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class MessageTest < Test::Unit::TestCase
    should "be retrievable" do
      message = Telnyx::Message.retrieve("651446f2-517d-42c0-f873-d539a1b3c672")
      # assert_requested :get, "#{Telnyx.api_base}/messages/#{message.id}"
      assert message.is_a?(Telnyx::Message)
    end

    should "be creatable" do
      message = Telnyx::Message.create(to: "+18005554000", from: "+18005559000", text: "Hello, World!")
      assert_requested :post, "#{Telnyx.api_base}/messages"
      assert message.is_a?(Telnyx::Message)
    end
  end
end
