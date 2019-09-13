{-# LANGUAGE FlexibleContexts #-}

module Data.Map.Lens.Misc where

import Control.Lens

findOrInsert :: (At t, Eq (IxValue t)) => Index t -> IxValue t -> t -> (IxValue t, t)
findOrInsert k v = at k . non v <%~ id
