import nimbox
import os
import player

proc hello(screen: Nimbox): bool =
  var evt: Event
  var width: int = screen.width
  var height: int = screen.height
  var player: Player = newPlayer(0, width div 2, height div 2)

  while true:

    screen.clear()
    for x in 0..<width:
      for y in 0..<height:
        if x == 0 or y == 0 or x == width-1 or y == height-1:
          screen.print(x, y, "#")
        else: screen.print(x, y, ".")

    screen.print(player.x, player.y, "@")

    screen.present()

    evt = screen.peekEvent(1000)
    case evt.kind:
      of EventType.Key:
        if evt.sym == Symbol.Escape:
          break
      else: discard

when isMainModule:
  var nb = newNimbox()
  defer: nb.shutdown()

  discard hello(nb)
