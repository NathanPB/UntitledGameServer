module Entity where
import Physical (Position)

data Entity = Entity {
  position :: Position
} deriving (Show)
