module Control.Lens.Misc
    ( module Control.Lens.Tagged.Misc
    , module Control.Lens.TH.Misc
    , module Control.Lens.Zoom.Misc
    , module Data.Map.Lens.Misc
    , module Control.Lens
    , Getting'
    ) where

import Control.Lens
import Control.Lens.Tagged.Misc
import Control.Lens.TH.Misc
import Control.Lens.Zoom.Misc
import Data.Map.Lens.Misc

type Getting' s a = Getting a s a
