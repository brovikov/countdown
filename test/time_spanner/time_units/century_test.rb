require 'test_helper'

module TimeSpanner
  module TimeUnits

    class CenturyTest < TestCase

      it 'initializes' do
        century = Century.new

        assert century.kind_of?(TimeUnit)
        assert_equal 2, century.position
        assert_equal :centuries, century.plural_name
      end

      it 'calculates without rest' do
        starting_time = DateTime.parse('2013-04-01 00:00:00')
        target_time   = DateTime.parse('2213-04-01 00:00:00')
        century       = Century.new

        century.calculate(starting_time, target_time)

        assert_equal 2, century.amount
        assert_equal 0, century.rest
      end

      it 'calculates with rest (1 day in nanoseconds)' do
        starting_time = DateTime.parse('2013-01-01 00:00:00')
        target_time   = DateTime.parse('2213-01-02 00:00:00')
        century       = Century.new

        century.calculate(starting_time, target_time)

        assert_equal 2, century.amount
        assert_equal 86400000000000, century.rest
      end

    end
  end
end