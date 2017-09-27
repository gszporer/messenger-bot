class GifService 

  def self.find_gif query
    url = HTTP.get(ENV["GIPHY_URL"] + query).parse.dig('data', 'image_url')

    {
      attachment: {
        type: 'image',
        payload: {
          url: url
        }
      }
    }
  end
end