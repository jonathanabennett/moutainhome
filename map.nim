import tables

type
  Location* = tuple[x:int, y:int]

  Rect = ref object of RootObj
    top_left: Location
    width: int
    height: int

  Tile = ref object of RootObj
    x: int
    y: int
    blocked*: bool

  Map* = ref object of RootObj
    id*: int
    width*: int
    height*: int
    map*: Table[Location, Tile]

proc newTile(x: int, y: int, blocked: bool = true): Tile =
  new result
  result.x = x
  result.y = y
  result.blocked = blocked

proc newRect(top_left: Location, width, height: int): Rect = 
  new result
  result.top_left = top_left
  result.width = width
  result.height = height

proc newRect(x1: int, y1: int, x2: int, y2: int): Rect =
  var top_left = (x1, y1)
  newRect(top_left, x2, y2)

proc makeRoom(map: Map, room:Rect): bool =
  for x in room.top_left.x+1..<room.top_left.x+room.width:
    for y in room.top_left.y+1..<room.top_left.x+room.height:
      map.map[(x,y)].blocked = false


proc newMap*(id: int, width: int, height: int): Map =
  new result
  result.id = id
  result.width = width
  result.height = height
  var map = initTable[Location, Tile]()
  result.map = map

  for x in 0..<width:
    for y in 0..<height:
      var loc: Location = (x, y)
      var tile: Tile = newTile(x, y)
      result.map[loc] = tile

proc sampleMap*(id: int, width: int, height: int): Map =
  result = newMap(id, width, height)

  discard result.makeRoom(newRect(20,15,10,15))
#  discard result.makeRoom(newRect(50,15,10,15))
