module World where

import Entity (Entity)
import Block (Block)
import Physical (Position)

import Data.Map.Strict as HashMap
import Data.Time.Clock.POSIX
import Control.Concurrent

data WorldChunk = WorldChunk {
    position :: Position,
    entities :: [Entity],
    blocks :: [Block]
} deriving (Show)

data WorldState = WorldState {
  physical :: PhysicalWorldState
} deriving (Show)

data PhysicalWorldState = PhysicalWorldState {
  chunks :: [WorldChunk]
} deriving (Show)

currentTimeMillis :: IO Integer
currentTimeMillis = getCurrentTime >>= pure . (1000*) . utcTimeToPOSIXSeconds >>= pure . round

getNextTickTime :: Integer->Integer->Integer
getNextTickTime = (+)

delayToNextTick :: Integer->Integer->Integer
delayToNextTick = (-)

worldTick :: WorldState->WorldState
worldTick worldState = worldState

worldTickLoop :: WorldState->IO ()
worldTickLoop worldState = do
    currentTimeMillis >>= \time -> do
        let currentTickStartTime = getNextTickTime time 100000
        threadDelay $ fromInteger $ delayToNextTick currentTickStartTime time
        worldTickLoop $ worldTick worldState
