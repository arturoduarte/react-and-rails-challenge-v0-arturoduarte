# frozen_string_literal: true

class SearchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :query

  attribute :jobs do |object|
    ::JobSerializer.new(object.jobs)
  end
end
