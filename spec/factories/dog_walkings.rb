FactoryBot.define do
      start_time = (Time.now - 30.minutes)
      end_time = Time.now
  factory :dog_walking do
      status { nil }
      scheduled_date { Date.today }
      price { 0.0 }
      duration { TimeHelper.diference_hour(start_time, end_time) }
      latitude { 73.667595 }
      longitude { 41.022921 }
      start_time { TimeHelper.time_format(start_time) }
      end_time { TimeHelper.time_format(end_time) }
  

    trait :created do  
      status { 0 } #created
      start_time { nil }
      end_time { nil }
    end

    trait :started do  
      status { 1 } #started
      end_time { nil }
    end

    trait :finished do  
      status { 2 } #fished
    end

    trait :min30 do
      start_time = Time.now() 
      start_time { TimeHelper.time_format(start_time - 29.minutes) }
      end_time { TimeHelper.time_format(start_time) }
      duration { TimeHelper.diference_hour(start_time, end_time) }
    end

    trait :min60 do
      start_time = Time.now() 
      start_time { TimeHelper.time_format(start_time - 59.minutes) }
      end_time { TimeHelper.time_format(start_time) } 
      duration { TimeHelper.diference_hour(start_time, end_time) } 
    end
    
    trait :min30future do
      start_time = Time.now()
      scheduled_date { Date.today + rand(365).days } 
      start_time { TimeHelper.time_format(start_time - 29.minutes) }
      end_time { start_time }
      duration { TimeHelper.diference_hour(start_time, end_time) }
    end

    trait :min60future do
      start_time = Time.now()
      scheduled_date { Date.today - rand(365).days }
      start_time { TimeHelper.time_format(start_time - 59.minutes) }
      end_time { TimeHelper.time_format(start_time) }  
      duration { TimeHelper.diference_hour(start_time, end_time) }
    end

    
    trait :min30past do
      start_time = Time.now()
      scheduled_date { Date.today - rand(365).days }
      start_time { TimeHelper.time_format(start_time - 29.minutes) }
      end_time { TimeHelper.time_format(start_time) }
      duration { TimeHelper.diference_hour(start_time, end_time) }
    end

    trait :min60past do
      start_time = Time.now()  
      scheduled_date { Date.today - rand(365).days }
      start_time { TimeHelper.time_format(start_time - 59.minutes) }
      end_time { TimeHelper.time_format(start_time) }
      duration { TimeHelper.diference_hour(start_time, end_time) }
    end
  end
end