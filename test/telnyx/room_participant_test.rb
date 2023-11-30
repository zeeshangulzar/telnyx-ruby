# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class RoomParticipantTest < Test::Unit::TestCase
    should "be listable" do
      room_compositions = RoomParticipant.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/room_participants")
      assert_kind_of Telnyx::TelnyxObject, room_compositions
    end

    should "be viewable" do
    room_composition_id = '5219b3af-87c6-4c08-9b58-5a533d893e21'
    room_composition = RoomParticipant.retrieve(room_composition_id)
    assert_requested :get, "#{Telnyx.api_base}/v2/room_participants/#{room_composition_id}"
    end
  end
end
