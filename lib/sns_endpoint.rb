require "rubygems"
require 'bundler/setup'
require "sns_endpoint/version"
require 'sinatra'
require 'json'
require 'message'

module SnsEndpoint
  
  class << self
    attr_accessor :topics_list, :subscribe_proc, :message_proc
  end
  
  def self.setup(&block)
    yield self
  end
  
  class Core < Sinatra::Base
    
      post '/' do
        json = JSON.parse(request.body.read)
        sns = SnsEndpoint::AWS::SNS::Message.new json
        if sns.authentic?
          if sns.type == :SubscriptionConfirmation
            if SnsEndpoint.topics_list.include? json['TopicArn']
              HTTParty.get json['SubscribeURL']
              SnsEndpoint.subscribe_proc.call(json)
            end
          elsif sns.type == :Notification
            SnsEndpoint.message_proc.call(json)            
          end
        end
      end
    
  end
end
