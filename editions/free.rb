# frozen_string_literal: true

require './editions/morning'
require './editions/afternoon'

module Editions
  class Free < Morning
    def elements
      [
        generic_title('Futures', 'Pre-Market Data', formatted_time),
        Templates::Element.spacer('20px'),
        item_futures(:sp500),
        item_futures(:nasdaq),
        item_futures(:dowjones),
        Templates::Element.divider,
        generic_title('Performance'),
        sp500_performance,
        nasdaq_performance,
        dowjones_performance,
        bitcoin_performance,
        Templates::Element.spacer('20px'),
        subscribe_premium
      ]
    end

    def subscribe_premium
      headline = [
        'Crypto, top gainers and losers',
        'International markets, asia & EU futures',
        'Sector performance and YTD stats',
        'No ads and all time high performance',
        'Russell 2k, Gold and 10-Yr Treasury',
        'Ad free, trending stocks and more'
      ].sample

      label = [
        'Subscribe for $1.99/mo',
        'Give it a try',
        'Try it for $1.99/mo',
        'Sign up for $1.99/mo',
        'Join now for $1.99/mo',
        'Go premium',
        'Become a PRO',
        'Only $1.99/mo',
        'Upgrade for $1.99/mo'
      ].sample

      [
        Templates::Element.subscribe_premium(headline, label)
      ]
    end

    def name
      'Free edition'
    end

    def free_trending
      trending(2)
    end

    def subscribers_group_id
      Services::Config.free_group
    end
  end
end
