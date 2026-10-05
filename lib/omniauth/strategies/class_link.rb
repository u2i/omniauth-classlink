require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class ClassLink < OmniAuth::Strategies::OAuth2
      option :name, :classlink
      option :client_options, {
        site:          'https://auth.apis.classlink.com',
        authorize_url: '/oauth2/v3/auth',
        token_url:     '/oauth2/v3/token'
      }
      option :fields, [:email, :profile]
      option :uid_field, 'UserId'

      uid do
        raw_info[options.uid_field.to_s]
      end

      def authorize_params
        super.tap do |params|
          params[:scope] = [:email, :profile]
          params[:response_type] = :code
          params[:grant_type] = :authorization_code
        end
      end

      info do
        {
          first_name: raw_info['FirstName'],
          last_name: raw_info['LastName'],
          district_id: raw_info['TenantId'],
          classlink_id: raw_info['UserId'],
          external_id: raw_info['SourcedId'],
          role: raw_info['Role'],
          email: raw_info['Email'],
          image: raw_info['ImagePath']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def default_headers
        {
          'Accept': 'application/json',
          'Authorization': "Bearer #{access_token}"
        }
      end

      def raw_info
        @raw_info ||= access_token.get(
          'https://auth.apis.classlink.com/myinfo',
          headers: default_headers
        ).parsed
      end

      private

      def callback_url
        # You can overwrite it for development purposes
        options[:redirect_uri] || super
      end
    end
  end
end
