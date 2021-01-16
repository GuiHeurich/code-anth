module Web
  module Controllers
    module Readings
      class Index
        include Web::Action
        expose :title, :next_reading, :past_reading

        def call(params)
          @title = 'CodeAnth Readings'
          @next_reading, @past_reading = get_readings
        end

        private
        def get_readings
          repository = ReadingRepository.new
          all_readings = repository.all

          [
            get_next_reading(all_readings),
            sort_past_reading(all_readings)
          ]
        end

        def get_next_reading(readings)
          readings.select { |reading| reading.meeting_date >= Time.now }.first
        end

        def sort_past_reading(readings)
          readings.select { |reading| reading.meeting_date < Time.now }
        end
      end
    end
  end
end
