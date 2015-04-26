require 'twitter'
require 'logger'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :tweets

  def tweets()
    @tweets = []

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.oauth_token = ENV['TWITTER_ACCESS_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    # TODO: change this to user_timeline
    @tweets = client.home_timeline(count: 10)
  rescue
    logger.warn 'Failed to retrieve tweets from twitter. Are you environment vars set?'
  end

  def index()
  end
end
