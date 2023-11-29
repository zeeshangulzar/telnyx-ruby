
# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class NumberOrderDocumentTest < Test::Unit::TestCase
    should "be retrievable" do
      number_order_document = NumberOrderDocument.retrieve "sit"
      # assert_requested :get, "#{Telnyx.api_base}/v2/number_order_documents/#{number_order_document.id}"
      assert_kind_of NumberOrderDocument, number_order_document
    end

    should "be creatable" do
      number_order_document = NumberOrderDocument.create
      assert_requested :post, "#{Telnyx.api_base}/number_order_documents"
      assert_kind_of NumberOrderDocument, number_order_document
    end

    should "be listable" do
      number_order_documents = NumberOrderDocument.list
      assert_requested :get, "#{Telnyx.api_base}/number_order_documents"
      assert_kind_of Array, number_order_documents.data
      assert_kind_of NumberOrderDocument, number_order_documents.first
    end

    should "be saveable" do
      number_order_document = NumberOrderDocument.retrieve("sit")
      number_order_document.file_id = "1234"
      number_order_document.save
      assert_requested :patch, "#{Telnyx.api_base}/number_order_documents/#{number_order_document.id}"
      assert_kind_of NumberOrderDocument, number_order_document
    end
  end
end
