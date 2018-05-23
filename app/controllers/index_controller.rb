class IndexController < ApplicationController
  def index
    public_key = Rails.application.credentials.pass[:public_key]
    private_key = Rails.application.credentials.pass[:private_key]
    ts = Date.today
    hash = Digest::MD5.hexdigest(ts.to_s+private_key+public_key)
    key_pack = "?ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
    url = 'http://gateway.marvel.com/v1/public/'
    storyId = '67528'

    stories_uri = "#{url}comics/#{storyId}#{key_pack}"
    stories = JSON.parse(Net::HTTP.get(URI.parse(stories_uri)))
    @attribute_text = stories['attributionText']
    @story =  stories['data']['results'][0]

    characters_uri = "#{url}comics/67528/characters#{key_pack}"
    characters = JSON.parse(Net::HTTP.get(URI.parse(characters_uri)))
    @characters =  characters['data']['results']
  end
end
