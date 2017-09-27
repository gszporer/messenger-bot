class NumberService

  def self.find_fact query
    url = HTTP.get(ENV["NUMBER_URL"] + query.to_s).to_s
  end
end