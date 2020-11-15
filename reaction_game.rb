require 'ruby2d'

message = Text.new('Click to begin', x: 25, y: 25)
game_started = false
square = nil
start_time = nil
duration = nil

set title: 'Reaction Game'

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 1000).round
      message = Text.new("Well done! You took : #{duration} milliseconds, Click to begin", x: 25, y: 25)
      square.remove
      game_started = false

    end
  else
    message.remove

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
