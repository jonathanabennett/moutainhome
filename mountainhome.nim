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
        if evt.ch == 'q':
          break
        if evt.ch == 'h':
          discard movePlayer(player, Direction.WEST)
        if evt.ch == 'l':
          discard movePlayer(player, Direction.EAST)
        if evt.ch == 'j':
          discard movePlayer(player, Direction.SOUTH)
        if evt.ch == 'k':
          discard movePlayer(player, Direction.NORTH)
        if evt.ch == 'y':
          discard movePlayer(player, Direction.NORTHWEST)
        if evt.ch == 'u':
          discard movePlayer(player, Direction.NORTHEAST)
        if evt.ch == 'b':
          discard movePlayer(player, Direction.SOUTHWEST)
        if evt.ch == 'n':
          discard movePlayer(player, Direction.SOUTHEAST)
      else: discard

when isMainModule:
  var nb = newNimbox()
  defer: nb.shutdown()

  discard hello(nb)
