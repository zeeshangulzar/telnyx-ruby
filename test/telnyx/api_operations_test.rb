# -*- coding: utf-8 -*-
# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class ApiOperationsTest < Test::Unit::TestCase
    class UpdateableResource < APIResource
      include Telnyx::APIOperations::Save

      OBJECT_NAME = "updateableresource".freeze

      def self.protected_fields
        [:protected]
      end
    end

    context ".update" do
      should "patch the correct parameters to the resource URL" do
        stub_patch = stub_request(:patch, "#{Telnyx.api_base}/messaging_profiles/b2fd6371-cffa-313c-d3af-bc838245fec8")
                     .with(body: { foo: "bar" })
                     .to_return(body: JSON.generate(data: { record_type: "messaging_profile", foo: "bar" }))
        resource = MessagingProfile.update("b2fd6371-cffa-313c-d3af-bc838245fec8", foo: "bar")
        assert_requested(stub_patch)
        assert_equal("bar", resource.foo)
      end

      should "error on protected fields" do
        e = assert_raises do
          UpdateableResource.update("id", protected: "bar")
        end
        assert_equal "Cannot update protected field: protected", e.message
      end
    end

    context ".nested_resource_class_methods" do
      class MainResource < APIResource
        extend Telnyx::APIOperations::NestedResource
        OBJECT_NAME = "mainresource".freeze
        Telnyx::Util.push_object_class OBJECT_NAME, self
        nested_resource_class_methods :nested,
                                      operations: %i[create retrieve update delete list],
                                      instance_methods: { create: nil, retrieve: nil, update: nil, delete: nil, list: nil }
      end

      should "define a create method" do
        stub_request(:post, "#{Telnyx.api_base}/mainresources/id/nesteds")
          .with(body: { foo: "bar" })
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
        nested_resource = MainResource.create_nested("id", foo: "bar")
        assert_equal "bar", nested_resource.foo
      end

      should "define a create instance method" do
        stub_request(:post, "#{Telnyx.api_base}/mainresources/id/nesteds")
          .with(body: { foo: "bar" })
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
        resource = Telnyx::Util.convert_to_telnyx_object(id: "id", record_type: "mainresource")
        nested_resource = resource.create_nested(foo: "bar")
        assert_equal "bar", nested_resource.foo
      end

      should "define a retrieve method" do
        stub_request(:get, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
        nested_resource = MainResource.retrieve_nested("id", "nested_id")
        assert_equal "bar", nested_resource.foo
      end

      should "define a retrieve instance method" do
        stub_request(:get, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
        resource = Telnyx::Util.convert_to_telnyx_object(id: "id", record_type: "mainresource")
        nested_resource = resource.retrieve_nested("nested_id")
        assert_equal "bar", nested_resource.foo
      end

      should "define an update method" do
        stub_patch = stub_request(:patch, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
                     .with(body: { foo: "baz" })
                     .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "baz"))
        nested_resource = MainResource.update_nested("id", "nested_id", foo: "baz")
        assert_requested(stub_patch)
        assert_equal "baz", nested_resource.foo
      end

      should "define an update instance method" do
        stub_patch = stub_request(:patch, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
                     .with(body: { foo: "baz" })
                     .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "baz"))
        resource = Telnyx::Util.convert_to_telnyx_object(id: "id", record_type: "mainresource")
        nested_resource = resource.update_nested("nested_id", foo: "baz")
        assert_requested(stub_patch)
        assert_equal "baz", nested_resource.foo
      end

      should "define a delete method" do
        stub_request(:delete, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", deleted: true))
        nested_resource = MainResource.delete_nested("id", "nested_id")
        assert_equal true, nested_resource.deleted
      end

      should "define a delete instance method" do
        stub_request(:delete, "#{Telnyx.api_base}/mainresources/id/nesteds/nested_id")
          .to_return(body: JSON.generate(id: "nested_id", object: "nested", deleted: true))
        resource = Telnyx::Util.convert_to_telnyx_object(id: "id", record_type: "mainresource")
        nested_resource = resource.delete_nested("nested_id")
        assert_equal true, nested_resource.deleted
      end

      should "define a list method" do
        stub_get = stub_request(:get, "#{Telnyx.api_base}/mainresources/id/nesteds")
                   .to_return(body: JSON.generate(data: [{ record_type: "foo" }]))
        nested_resources = MainResource.list_nesteds("id")
        assert_requested(stub_get)
        assert nested_resources.is_a?(ListObject)
        assert nested_resources.data.is_a?(Array)
      end

      should "define a list instance method" do
        stub_get = stub_request(:get, "#{Telnyx.api_base}/mainresources/id/nesteds")
                   .to_return(body: JSON.generate(data: [{ record_type: "foo" }]))
        resource = Telnyx::Util.convert_to_telnyx_object(id: "id", record_type: "mainresource")
        nested_resources = resource.list_nesteds
        assert_requested(stub_get)
        assert nested_resources.is_a?(ListObject)
        assert nested_resources.data.is_a?(Array)
      end
    end
  end
end
