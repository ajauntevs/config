import XMonad
import XMonad.Util.Run
import XMonad.Config.Desktop

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition

import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.Renamed
import XMonad.Layout.MultiColumns

main = do
    xpipe <- spawnPipe "xmobar"
    xmonad $ desktopConfig  { layoutHook = avoidStruts $ smartBorders $ myLayouts
			    , handleEventHook = docksEventHook <+> handleEventHook desktopConfig
			    , manageHook = insertPosition End Newer
			    , logHook = dynamicLogWithPP $ xmobarPP {	ppOutput = hPutStrLn xpipe
								    ,	ppTitle = xmobarColor "#A9A9A9" "" . shorten 120
								    }
			    , terminal = myTerminal
			    , modMask = myModMask
			    , borderWidth = myBorderWidth
			    , normalBorderColor = myNormalBorderColor
			    , focusedBorderColor = myFocusedBorderColor
			    }

columnLayout = renamed [Replace "Columns"] $ multiCol [1, 1, 1, 1, 3] 0 0.03 0.7
tallLayout = Tall 1 (3/100) (3/5)

myLayouts	= columnLayout ||| tallLayout ||| Full
myTerminal	= "urxvt"
myModMask	= mod4Mask
myBorderWidth	= 1
myNormalBorderColor	= "#000000"
myFocusedBorderColor	= "#C9C9C9"

