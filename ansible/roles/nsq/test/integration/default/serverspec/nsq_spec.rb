require 'spec_helper'

describe 'NSQ role general specs' do
  %w(nsq__pubsub nsq__stat nsq__tail nsq__to_file nsq__to_http nsq__to_nsq to_nsq).each do |binary|
    describe file("/usr/local/bin/#{binary}") do
      it { should exist }
    end
  end
end
