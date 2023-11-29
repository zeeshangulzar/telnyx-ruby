# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class OtaUpdateTest < Test::Unit::TestCase
    should "be retrievable" do
      ota_update = OtaUpdate.retrieve "e7ae9b61-1304-ce6f-8843-68e2a9d7d06d"
      # assert_requested :get, "#{Telnyx.api_base}/ota_updates/#{ota_update.id}"
      assert_kind_of OtaUpdate, ota_update
    end

    should "be listable" do
      ota_updates = OtaUpdate.list
      assert_requested :get, "#{Telnyx.api_base}/ota_updates"
      assert_kind_of ListObject, ota_updates
      assert_kind_of OtaUpdate, ota_updates.first
    end
  end
end
