import nimbox, os, tables

import player, map


proc hello(screen: Nimbox): bool =
  var evt: Event
  var width: int = screen.width
  var height: int = screen.height
  var player: Player = newPlayer(0, 25, 23)
  var map: Map = sampleMap(0, screen.width, screen.height)
  

  while true:

    screen.clear()
    for x in 0..<width:
      for y in 0..<height:
        if map.map[(x,y)].blocked == true:
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
          discard movePlayer(player, map, Direction.WEST)
        if evt.ch == 'l':
          discard movePlayer(player, map, Direction.EAST)
        if evt.ch == 'j':
          discard movePlayer(player, map, Direction.SOUTH)
        if evt.ch == 'k':
          discard movePlayer(player, map, Direction.NORTH)
        if evt.ch == 'y':
          discard movePlayer(player, map, Direction.NORTHWEST)
        if evt.ch == 'u':
          discard movePlayer(player, map, Direction.NORTHEAST)
        if evt.ch == 'b':
          discard movePlayer(player, map, Direction.SOUTHWEST)
        if evt.ch == 'n':
          discard movePlayer(player, map, Direction.SOUTHEAST)
      else: discard

when isMainModule:
  var nb = newNimbox()
  defer: nb.shutdown()

  discard hello(nb)
