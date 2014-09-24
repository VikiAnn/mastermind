class GameTime
  attr_reader :start_time, :stop_time
  
  def start
    @start_time = Time.now
  end

  def stop
    @stop_time = Time.now
  end

  def total
    seconds_taken = @stop_time - @start_time
    if seconds_taken < 60
      time = "#{seconds_taken.to_i} seconds"
    else
      minutes = (seconds_taken / 60).to_i
      seconds = (seconds_taken % 60).to_i
      time = "#{minutes} minutes and #{seconds} seconds"
    end
    time
  end
end
