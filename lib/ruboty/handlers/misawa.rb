# coding: utf-8

require 'open-uri'
require 'json'

module Ruboty
  module Handlers
    class Misawa < Base
      on /misawa( me)? ?(?<keyword>.+)?/, name: 'misawa', description: 'Generate horesase boy image matching with the keyword'
      env :MISAWA_ENDPOINT, "misawa db(default: http://horesase-boys.herokuapp.com/meigens.json)", optional: true

      def misawa(message={})
        keyword = message[:keyword]
        unless keyword.nil?
          m = meigens.select{|meigen|
            %w(title character body).any? {|key|
              meigen[key] and meigen[key].include?(keyword)
            }
          }.sample
        end
        if keyword.nil? || m.nil?
          m = meigens.sample
        end
        if m then
          message.reply m['image']
        end
      end

      private
      def meigens
        JSON.parse(open(ENV['MISAWA_ENDPOINT'] || 'http://horesase-boys.herokuapp.com/meigens.json').read)
      end
    end
  end
end

