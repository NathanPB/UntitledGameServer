module WorldGenerator where

import Math
import Physical

import Numeric.Noise.Perlin

minSurfaceHeight = 16
maxSurfaceHeight = 64

noiseAt :: Perlin->Int->Int->Double
noiseAt perlin x y = noiseValue perlin (fromIntegral x, fromIntegral y, 0)

generatePerlinHeightmap :: Perlin->Int->Int->Int->Int->[[Double]]
generatePerlinHeightmap perlin width height initialX initialY = map (\x -> map (\y -> noiseAt perlin (initialX + x) (initialY + y)) [0..height]) [0..width]

mapHeightOfPerlinHeightmap :: [[Double]]->[[Int]]
mapHeightOfPerlinHeightmap = map2dVector (\x -> ceiling $ lerp x minSurfaceHeight maxSurfaceHeight)

heightmapTo3dCoords :: [[Int]]->[Position]
heightmapTo3dCoords input = concat $ concat $ map2dVectorIndexed (\height x z -> map (\y -> Position x y z) [0..height]) input
