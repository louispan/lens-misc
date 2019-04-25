{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Control.Lens.Misc.Zoom where

import Control.Lens

-- | 'magnifying'ing with a Traversal constrains the result type @a@ to be a 'Monoid'.
-- This allows temporarily wrapping @a@ into a 'Monoid' when 'magnifying'
-- @Control.Newtype.underF Sum f ≡ mapping (iso Sum getSum) %~ f@
magnifyUnder :: Magnify m m' s t => AnIso' o n -> LensLike' (Magnified m n) t s -> m o -> m' o
magnifyUnder wrapperIso lns = mapping wrapperIso %~ (magnify lns)

-- | 'zoom'ing with a Traversal constrains the result type @a@ to be a 'Monoid'.
-- This allows temporarily wrapping @a@ into a 'Monoid'.
-- @Control.Newtype.underF Sum f ≡ mapping (iso Sum getSum) %~ f@
zoomUnder :: Zoom m m' s t => AnIso' o n -> LensLike' (Zoomed m n) t s -> m o -> m' o
zoomUnder wrapperIso lns = mapping wrapperIso %~ (zoom lns)
