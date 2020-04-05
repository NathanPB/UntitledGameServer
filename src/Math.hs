module Math where

normalize :: Double->Double->Double->Double
normalize x min max = (x-min) / (max-min)

lerp :: Double->Double->Double->Double
lerp x min max = min + ((max - min) * x)

map2dVectorIndexed :: (a->Int->Int->b)->[[a]]->[[b]]
map2dVectorIndexed f input = mapIndexed (\row x -> mapIndexed(\element y -> f element x y) row) input

map2dVector :: (a->b)->[[a]]->[[b]]
map2dVector f input = map (\row -> map f row) input

mapIndexed :: (a->Int->b)->[a]->[b]
mapIndexed f l = zipWith f l [0..]

normalize2dVector :: [[Double]]->[[Double]]
normalize2dVector input = map2dVector (\x -> normalize x min max) input
        where flatArray = concat input
              min = minimum flatArray
              max = maximum flatArray

