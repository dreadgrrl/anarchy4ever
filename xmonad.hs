import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import System.IO

myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"] 

modm = mod4Mask -- so we can change it in one location

myManageHook = composeAll
    [ 
      className =? "Pidgin" --> doShift "2" -- All pidgin windows will spawn on workspace 2
    , className =? "Skype" --> doShift "2" -- All skype windows will spawn on workspace 2
    , className =? "Thunderbird" --> doShift "3" -- thunderbird windows spawn on ws 2
    ]

numPadKeys = [ xK_KP_End,   xK_KP_Down,     xK_KP_Page_Down -- 1, 2, 3
             , xK_KP_Left,  xK_KP_Begin,    xK_KP_Right     -- 4, 5, 6
             , xK_KP_Home,  xK_KP_Up,       xK_KP_Page_Up   -- 7, 8, 9
             , xK_KP_Insert ] -- 0

myKeys = [((modm .|. shiftMask, xK_z), spawn "xscreensaver-command -lock") -- mod+shift+z = lock
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s") -- ctrl+printscrn = screenshot area
        , ((0, xK_Print), spawn "scrot") -- printscrn = screenshot
        , ((modm .|. shiftMask, xK_f), spawn "files") -- files is a script that launches pcmanfm with dbus support, so mod+shift+f = pcmanfm
        ]
        ++
        [((m .|. modm, k), windows $ f i) -- this block sets up numpad workspace switching but idgi
            | (i, k) <- zip myWorkspaces numPadKeys
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
        ]

main = do 
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , terminal = "urxvt"
        , modMask = modm -- rebind mod to whatever modm is
        } `additionalKeys` myKeys
    
