module Entity where
import Physical (Position)

data Entity = Entity {
  id :: String,
  position :: Position
} deriving (Show)
