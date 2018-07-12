import tables

type
  Location* = tuple[x:int, y:int]

  Tile = ref object of RootObj
    x: int
    y: int
    blocked*: bool

  Map* = ref object of RootObj
    id*: int
    width*: int
    height*: int
    map*: Table[Location, Tile]

proc newTile(x: int, y: int, blocked: bool = false): Tile =
  new result
  result.x = x
  result.y = y
  result.blocked = blocked

proc sampleMap*(id: int, width: int, height: int): Map =
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
      if x == 0 or x == width-1 or y == 0 or y == height-1:
        tile.blocked = true
      result.map[loc] = tile
