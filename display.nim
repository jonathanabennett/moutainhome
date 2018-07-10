import nimbox
import os

proc hello(screen: Nimbox): bool =
  var evt: Event
  var width: int = screen.width
  var height: int = screen.height

  while true:

    screen.clear()
    for x in 0..<width:
      for y in 0..<height:
        screen.print(x, y, "#")

    screen.print(width, height, "Welcome to MountainHome.")
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
