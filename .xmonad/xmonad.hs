{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

import Control.Monad

import XMonad
import qualified XMonad.StackSet as S
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Config.Desktop


import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.Renamed
import XMonad.Layout.MultiColumns

main = do
    xpipe <- spawnPipe "xmobar"
    xmonad $ desktopConfig  { layoutHook = avoidStruts $ smartBorders $ myLayouts
			    , handleEventHook = docksEventHook <+> handleEventHook desktopConfig
			    , manageHook = manageDocks 
						<+> (isFullscreen --> doFullFloat ) 
						<+> insertPosition Below Newer
			    , logHook = dynamicLogWithPP $ xmobarPP {	ppOutput = hPutStrLn xpipe
								    ,	ppTitle = xmobarColor "#A9A9A9" "" . shorten 120
								    }
			    , terminal = myTerminal
			    , modMask = myModMask
			    , borderWidth = myBorderWidth
			    , normalBorderColor = myNormalBorderColor
			    , focusedBorderColor = myFocusedBorderColor
			    } `additionalKeys` myKeys

columns = Columns (1/5) (3/100)
columnsFull = renamed [Replace "Columns Full"] $ multiCol [1, 1, 1, 1, 3] 0 0.03 0.7

myLayouts		= columns ||| columnsFull 
myTerminal		= "alacritty"
myModMask		= mod4Mask
myBorderWidth		= 1
myNormalBorderColor	= "#000000"
myFocusedBorderColor	= "#C9C9C9"
myKeys			=
	[((myModMask, xK_f), sendMessage ToggleStruts)]

data Columns a = Columns {
    columnsWidth :: !Rational,
    columnsDelta :: !Rational
} deriving (Show, Read)

instance LayoutClass Columns a where
    pureLayout (Columns f d) r = ap zip (makeRectangles r f . length) . S.integrate
	where makeRectangles r@(Rectangle rx ry rw rh) f c  
		| fw < 1 = splitHorizontally c (Rectangle nx ry nw rh)
		| otherwise = splitHorizontally c r
		    where   fw = fromIntegral c * f
			    nw = ceiling $ fromRational $ fw * (fromIntegral rw)
			    nx = fromIntegral $ (rw - nw) `div` 2

    handleMessage l m = 
	return $ fmap resize (fromMessage m)
	    where   resize Shrink = l { columnsWidth = max (1/10) $ w - d }
		    resize Expand = l { columnsWidth = min 1 $ w + d }
		    w = columnsWidth l
		    d = columnsDelta l
    description _ = "Columns"

