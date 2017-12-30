module Control.Lens.Misc where

import Control.Lens

-- | type restricted version of 'over'
over' :: ASetter' s a -> (a -> a) -> s -> s
over' = over
