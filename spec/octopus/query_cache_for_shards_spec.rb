require 'spec_helper'

unless Octopus.rails4?
  describe Octopus::ConnectionPool::QueryCacheForShards do
    subject(:query_cache_on_shard) { ActiveRecord::Base.using(:brazil).connection.query_cache_enabled }

    context 'when query cache is enabled on the primary connection_pool' do
      before { ActiveRecord::Base.connection_pool.enable_query_cache! }
      it { is_expected.to be true }
    end

    context 'when query cache is disabled on the primary connection_pool' do
      before { ActiveRecord::Base.connection_pool.disable_query_cache! }
      it { is_expected.to be false }
    end
  end
end
