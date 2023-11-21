# frozen_string_literal: true

module Telnyx
  class WireguardInterface < APIResource
    extend Telnyx::APIOperations::List
    extend Telnyx::APIOperations::Create
    extend Telnyx::APIOperations::Save
    extend Telnyx::APIOperations::Delete

    OBJECT_NAME = "wireguard_interface".freeze
  end
end
