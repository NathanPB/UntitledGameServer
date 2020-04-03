module Block (Block) where
import Physical (Position)

data Block = Block {
  id :: String,
  position :: Position
} deriving (Show)
