# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class RoomTest < Test::Unit::TestCase

    should "be listable" do
      rooms = Room.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/rooms")
      assert_kind_of TelnyxObject, rooms
    end

    should "be creatable" do
      room = Room.create(name: "Foo")
      assert_requested :post, "#{Telnyx.api_base}/v2/rooms"
      assert_kind_of TelnyxObject, room
    end

    should "be deletable" do
      # room_id = 'dabd5ddb-7c96-9cc1-2797-c9a7d6f3d6ac'
      # room= Room.retrieve(room_id)
      # # room.delete
      # assert_requested :delete, "#{Telnyx.api_base}/v2/rooms/#{room_session_id}"
    end

    should "be viewable" do
      room_id = 'dabd5ddb-7c96-9cc1-2797-c9a7d6f3d6ac'
      room= Room.retrieve(room_id)
      assert_requested :get, "#{Telnyx.api_base}/v2/rooms/#{room_id}"
    end

     should "be updateable" do
      # room_id = 'f9659fad-a061-a360-2ee3-510591fc8635'
      # room = Room.retrieve(room_id)

      # room.name = "new name"
      # room.save
      # assert_requested :patch, "#{Telnyx.api_base}/v2/rooms/#{room_id}"
    end

     should "list of room session" do
      # room_id = 'f9659fad-a061-a360-2ee3-510591fc8635'
      # room = Room.retrieve(room_id)

      # assert_requested :get, "#{Telnyx.api_base}/v2/rooms/#{room_id}/sessions"
    end
  end
end
