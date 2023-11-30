
module Telnyx
  class Room < APIResource
    include APIOperations::Delete
    extend APIOperations::List
    extend APIOperations::Create
    extend APIOperations::Save

    OBJECT_NAME = "room".freeze
  end
end
