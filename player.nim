#Player data
import tables
import thing
import map

type
  Player* = ref object of Thing

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
  new result
  result.id = id
  result.x = x
  result.y = y
  result.disp = "@"

proc movePlayer*(player:Player, map:Map, dir:Direction): bool =
  var newLoc: Location = (player.x, player.y)
  case dir
  of NORTH:
    newLoc.y -= 1
  of NORTHEAST:
    newLoc.y -= 1
    newLoc.x += 1
  of EAST:
    newLoc.x += 1
  of SOUTHEAST:
    newLoc.x += 1
    newLoc.y += 1
  of SOUTH:
    newLoc.y += 1
  of SOUTHWEST:
    newLoc.x -= 1
    newLoc.y += 1
  of WEST:
    newLoc.x -= 1
  of NORTHWEST:
    newLoc.x -= 1
    newLoc.y -= 1
  if not map.map[(newLoc)].blocked:
    player.x = newLoc.x
    player.y = newLoc.y
