module TimeHelper
  def self.time_format(d)
    begin
      d = d.to_time
      "#{'%02d' % d.hour}:#{'%02d' % d.min}:#{'%02d' % d.sec}"
    rescue
        return nil
    end
  end

  def self.diference_hour(start_time, end_time)
    begin
      ((end_time.to_time - start_time.to_time) / 60).to_i
    rescue
      return nil
    end
  end
end
