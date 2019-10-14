require 'rails_helper'

RSpec.describe TimeHelper, type: :service do
  describe '.time_format' do
    it 'with a valid date' do
      date_to_converte1 = "2019-10-14 08:32:50 -0300"
      date_to_converte2 = "2019-10-14T08:32:50"
      date_to_converte3 = "2019/02/20 08:00:00"
      expect(TimeHelper.time_format(date_to_converte1)).to eq('08:32:50')
      expect(TimeHelper.time_format(date_to_converte2)).to eq('08:32:50')
      expect(TimeHelper.time_format(date_to_converte3)).to eq('08:00:00')
    end

    it 'with a valid date only time' do
      date_to_converte = "08:50:50 -0300"
      expect(TimeHelper.time_format(date_to_converte)).to eq('08:50:50')
    end

    it 'with a valid date only time without utc+3' do
      date_to_converte = "08:50:50"
      expect(TimeHelper.time_format(date_to_converte)).to eq('08:50:50')
    end

    it 'with a invalid date' do
      date_to_converte = "abc"
      expect(TimeHelper.time_format(date_to_converte)).to be(nil)
    end
  end

  describe '.diference_hour' do
    it 'valid time 30 minutes' do
        start_time = '08:00:00'
        end_time = '08:30:00'
        expect(TimeHelper.diference_hour(start_time, end_time)).to eq(30)
    end

    it 'valid time 1 hour' do
      start_time = '08:00:00'
      end_time = '09:00:00'
      expect(TimeHelper.diference_hour(start_time, end_time)).to eq(60)
    end

    it 'invalid time 1 hour' do
      start_time = 'abc'
      end_time = '09:00:00'
      expect(TimeHelper.diference_hour(start_time, end_time)).to be(nil)
    end
  end
end