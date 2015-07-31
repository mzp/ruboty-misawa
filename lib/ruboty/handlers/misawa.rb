# coding: utf-8

require 'open-uri'
require 'json'

module Ruboty
  module Handlers
    class Misawa < Base
      on /misawa( me)? ?(?<keyword>.+)?/, name: 'misawa', description: 'Generate horesase boy image matching with the keyword'
      env :MISAWA_ENDPOINT, "misawa db(default: http://horesase.github.io/horesase-boys/meigens.json)", optional: true

      def misawa(message={})
        keyword = message[:keyword]
        if keyword.nil?
          m = meigens.sample
        else
          m = meigens.select{|meigen|
            %w(title character body).any? {|key|
              meigen[key] and meigen[key].include?(keyword)
            }
          }.sample
        end

        message.reply m['image'] if m
      end

      private
      def meigens
        @meigens ||= JSON.parse(open(ENV['MISAWA_ENDPOINT'] || 'http://horesase.github.io/horesase-boys/meigens.json').read)
      end
    end
  end
end
