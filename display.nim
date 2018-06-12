import nimbox
import os

proc hello(screen: Nimbox): bool =
  var evt: Event

  while true:
    screen.clear()
    screen.print(0, 0, "Hello, world!")
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
