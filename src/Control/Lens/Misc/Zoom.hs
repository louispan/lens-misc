{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Control.Lens.Misc.Zoom where

import Control.Lens

-- | 'magnifying'ing with a Traversal constrains the result type @a@ to be a 'Monoid'.
-- This allows temporarily wrapping @a@ into a 'Monoid' when 'magnifying'
-- @Control.Newtype.underF Sum f ≡ mapping (_Unwrapping Sum) %~ f@
-- Control.Lens.Wrapped (4.17) doc is wrong and used '_Wrapping'
-- '_Unwrapping' can be used with 'Control.Newtype.Generics' instances too.
magnifyUnder :: (Rewrapped wrapper wrapper, Magnify m m' s t, Unwrapped wrapper ~ a)
    => (a -> wrapper) -> LensLike' (Magnified m wrapper) t s -> m a -> m' a
magnifyUnder wrapper lns = mapping (_Unwrapping wrapper) %~ (magnify lns)

-- | 'zoom'ing with a Traversal constrains the result type @a@ to be a 'Monoid'.
-- This allows temporarily wrapping @a@ into a 'Monoid'.
-- @Control.Newtype.underF Sum f ≡ mapping (_Unwrapping Sum) %~ f@
-- Control.Lens.Wrapped (4.17) doc is wrong and used '_Wrapping'
-- @zoomUnder wrapper lns = Control.Newtype.Generics.underF wrapper (zoom lns)@
-- '_Unwrapping' can be used with 'Control.Newtype.Generics' instances too.
zoomUnder :: (Rewrapped wrapper wrapper, Zoom m m' s t, Unwrapped wrapper ~ a)
    => (a -> wrapper) -> LensLike' (Zoomed m wrapper) t s -> m a -> m' a
zoomUnder wrapper lns = mapping (_Unwrapping wrapper) %~ (zoom lns)
