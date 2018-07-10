#import map
#Player data

type
  Player* = ref object of RootObj
    id*: int
    x*: int
    y*: int

  Direction* = enum
    NORTH
    NORTHEAST
    EAST
    SOUTHEAST
    SOUTH
    SOUTHWEST
    WEST
    NORTHWEST

proc newPlayer*(id:int, x:int, y:int): Player =
  Player(id:id, x:x, y:y)

proc movePlayer*(player:Player, dir:Direction): bool =
  case dir
  of NORTH:
    player.y -= 1
  of NORTHEAST:
    player.y -= 1
    player.x += 1
  of EAST:
    player.x += 1
  of SOUTHEAST:
    player.x += 1
    player.y += 1
  of SOUTH:
    player.y += 1
  of SOUTHWEST:
    player.x -= 1
    player.y += 1
  of WEST:
    player.x -= 1
  of NORTHWEST:
    player.x -= 1
    player.y -= 1
