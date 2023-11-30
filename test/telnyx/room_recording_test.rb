# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class RoomRecordingTest < Test::Unit::TestCase

    should "be listable" do
      room_recordings = RoomRecording.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/room_recordings")
      assert_kind_of Telnyx::TelnyxObject, room_recordings
    end

    should "be deletable" do
      # room_recording_id = '73c4b97d-f19c-fec8-38ee-e6776c076487'
      # room_recording = RoomRecording.retrieve(room_recording_id)

      # room_recording.delete
      # assert_requested :delete, "#{Telnyx.api_base}/v2/room_recordingss/#{room_recording_id}"
    end

    should "be viewable" do
      room_recording_id = '73c4b97d-f19c-fec8-38ee-e6776c076487'
      room_recording = RoomRecording.retrieve(room_recording_id)
      assert_requested :get, "#{Telnyx.api_base}/v2/room_recordings/#{room_recording_id}"
    end
  end
end
