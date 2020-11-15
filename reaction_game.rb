require 'ruby2d'

message = Text.new('Click to play', x: 270, y: 200)
game_started = false
square = nil
start_time = nil
duration = nil
message2 = Text.new('Try to beat the Vos', x: 240, y: 40)

set title: 'Click Faster'

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 1000).round
      message = Text.new("Slow mother fucker!!! You took : #{duration} milliseconds, Click to begin", x: 25, y: 25)
      message2 = Text.new('Roos beats you', x: 270, y:200)

      square.remove
      game_started = false
    end

  else
    message.remove
    message2.remove

    square = Square.new(
    x: rand(get(:width) - 25), y: rand(get(:height) - 25),
    size: 25,
    color: 'blue',
    )

    start_time = Time.now
    game_started = true
  end
end

show
