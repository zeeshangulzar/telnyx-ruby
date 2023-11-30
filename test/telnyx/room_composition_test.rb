# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class RoomCompositionTest < Test::Unit::TestCase
    should "be listable" do
      room_compositions = RoomComposition.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/room_compositions")
      assert_kind_of Telnyx::TelnyxObject, room_compositions
    end

    should "be creatable" do
      RoomComposition.create text: "test", from: "+18445550001", to: "+18445550001"
      assert_requested :post, "#{Telnyx.api_base}/v2/room_compositions"
    end

    should "be deletable" do
      # room_composition_id = '23d7dcc9-a43b-6d51-dace-acfe22622af3'
      # room_composition = RoomComposition.retrieve(room_composition_id)

      # # room_composition.delete
      # assert_requested :delete, "#{Telnyx.api_base}/v2/room_compositions/#{room_composition_id}"
    end

    should "be viewable" do
      room_composition_id = '5219b3af-87c6-4c08-9b58-5a533d893e21'
      room_composition = RoomComposition.retrieve(room_composition_id)
      assert_requested :get, "#{Telnyx.api_base}/v2/room_compositions/#{room_composition_id}"
    end
  end
end
