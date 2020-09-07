# frozen_string_literal: true

class Search < ApplicationRecord
  API_URL = 'https://www.getonbrd.com/api/v0'
  
  validates_presence_of :query
  has_many :jobs
  
  def self.find_jobs(query)
    return unless query.present?
    
    uri = URI("#{API_URL}/search/jobs")
    uri.query = URI.encode_www_form({ query: query })
    
    res = Net::HTTP.get_response(uri)
    
    if res.is_a?(Net::HTTPSuccess)
      JSON.parse(res.body, symbolize_names: true)
    else
      raise "Unexpected error: #{res.message}, code: #{res.code}"
    end
  end
  
  def self.create!(query:)
    raise 'query should be a string' unless query.is_a?(String)
    
    ActiveRecord::Base.transaction do
      search = Search.find_by(query: query)              
      # search = previous_value.nil? ? super(query: query) : previous_value
      if search.nil? 
        search = super(query: query)
        
        find_jobs(query)[:data].each do |job|
          id = job[:id]
          attrs = job[:attributes]
          search.jobs << Job.new(slug: id,
          title: attrs.dig(:title),
          company: attrs.dig(:company, :name),
          link: "https://www.getonbrd.com/jobs/#{id}")
        end
        search      
      end
    end
  end
end
