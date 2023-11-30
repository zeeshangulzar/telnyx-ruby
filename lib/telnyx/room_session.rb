
module Telnyx
  class RoomSession < APIResource
    include APIOperations::Delete
    extend APIOperations::List
    extend APIOperations::Create

    OBJECT_NAME = "room_session".freeze
  end
end
