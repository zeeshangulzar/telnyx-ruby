# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class RoomSessionTest < Test::Unit::TestCase

    should "be listable" do
      room_sessions = RoomSession.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/room_sessions")
      assert_kind_of Telnyx::TelnyxObject, room_sessions
    end

    should "end the room" do
      # room_session_id = '05b280a1-7cca-3fd4-40bd-3c492e5b2388'
      # room_sessions= RoomSession.retrieve(room_session_id)
      # room_sessions.end
      # assert_requested :post, "#{Telnyx.api_base}/v2/room_sessions/#{room_session_id}/actions/end"
    end

    should "be deletable" do
      
    end

    should "be viewable" do
       room_session_id = '57a9cd9c-1959-110b-98e2-041a8245aec9'
       room_sessions = RoomSession.retrieve(room_session_id)
       assert_requested :get, "#{Telnyx.api_base}/v2/room_sessions/#{room_session_id}"
    end
  end
end
