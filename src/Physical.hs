module Physical(Side, Position) where

data Side = NORTH | SOUTH | EAST | WEST deriving (Show)

data Position = Position {
  x:: Int,
  y:: Int,
  z:: Int,
  facing:: Side
} deriving (Show)
