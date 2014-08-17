import XMonad
-- XMonad extra modules
import XMonad.Layout.Spacing		-- to change spacing between windows
import XMonad.Layout.NoBorders		-- to remove borders
import XMonad.Layout.PerWorkspace	-- to config per workspace
import XMonad.Util.EZConfig 		-- to load apps with keyboard shorcuts
-- XMobar modules
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import System.IO

-------------------------------------------------------------------
--Main--
main = do
  xmproc <- spawnPipe "/usr/local/bin/xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaultConfig {
	-- load Hooks for xmobar
	manageHook    = manageDocks <+> manageHook defaultConfig,
	logHook       = myLogHook xmproc,
	terminal      = myTerminal,
	borderWidth   = myBorderWidth,
	--normalBorderColor  = "#abc123",
	focusedBorderColor = "#456def",
	-- load myLayout nostruts for xmobar (info about window arrangement - strange name huh?)
	layoutHook = avoidStruts $ myLayout,
	-- load myWorkspaces (the definition of my workspaces!)
	workspaces = myWorkspaces,
	-- key & shorcuts
	modMask   = myModMask
	} `additionalKeys` [
    -- I SHOULD CHANGE THEM ALL TO THE KEY I DON'T USE (now ALT)
      -- launch console process monitor          (htop)
      ((mod4Mask .|. shiftMask, xK_h), spawn "urxvtc -e top"),
      ((mod4Mask, xK_h), spawn "urxvtc -e top"),
      -- launch graphic video player             (vlc)
      ((mod4Mask, xK_m), spawn "vlc"),
      --((mod4Mask, xK_m), spawn "mplayer ~/downloads/*")				-- launch video player		(mplayer)
      -- launch GUI podcatcher                       (amarok, gpodder for now)
      ((mod4Mask, xK_g), spawn "gpodder"),
      -- launch console podcatcher               (marria?)

      -- launch GUI file manager                 (dolphin, thunar for now)
      ((mod4Mask, xK_d), spawn "thunar"),
      -- launch file manager                     (MidnightComander)
      ((mod4Mask .|. shiftMask, xK_d), spawn "urxvtc -e mc"),
      -- launch GUI RSS client                   (notRSSOWl that supports tinytinyRSS)
      ((mod4Mask, xK_r), spawn "liferea"),
      -- launch console RSS client               (newsbeuter)
      ((mod4Mask .|. shiftMask, xK_r), spawn "urxvtc -e newsbeuter"),
      -- launch GUI browser                      (default) xombrero or firefox
      ((mod4Mask, xK_f), spawn "firefox"),
      -- launch console browser                  (default) xombrero or firefox
      ((mod4Mask .|. shiftMask, xK_r), spawn "urxvtc -e lynx"),
      -- launch console IRC client               (irssi)
      ((mod4Mask .|. shiftMask, xK_s), spawn "urxvtc -e irssi"),
      ((mod4Mask, xK_s), spawn "urxvtc -e irssi"),
      -- launch mpc client                       (ncmpcpp or pms)

      -- launch volume control                   (alsa-mixer for linux, my script in openbsd)

      -- launch mute/unmute script

      -- launch GUI torrent client               (transmission)
      ((mod4Mask, xK_g), spawn "transmission-qt"),
      -- launch console torrent client           (rtorrent or aria2)

      -- launch email client                     (thunderbird or alternative)

      -- launch document viewer                  (okular or something else)
      ((mod4Mask, xK_o), spawn "okular"),
      -- launch empty text editor                (vim)
      ((mod4Mask .|. shiftMask, xK_v), spawn "urxvtc -e vim"),
      ((mod4Mask, xK_v), spawn "urxvtc -e vim")
      -- launch wifi script to choose AP

      -- add alt-space to dmenu (mod-p by default)
	]
---------------------------------------------------------------------

-- Terminal ---------------------------------------------------------
myTerminal    = "urxvtc"
--myTerminal    = "urxvtcd"
--myTerminal    = "urxvt"
-- Border width -----------------------------------------------------
myBorderWidth = 2
-- Mod Key ----------------------------------------------------------
myModMask     = mod4Mask
-- Workspaces & Layout ----------------------------------------------
-- defining the min layout,
nobordersLayout = noBorders Full
-- Joining all layouts in a variable
myLayout = onWorkspace "8:full" nobordersLayout $ defaultLayout
myWorkspaces = ["1:main","2:tsun","3:yan","4","5","6","7","8:full","9:min"]
-- XMobar config ----------------------------------------------------
myLogHook h = dynamicLogWithPP xmobarPP {
	ppOutput = hPutStrLn h,
	ppLayout = const "", -- to disable the layout info on xmobar
	ppTitle  = xmobarColor "blue" "" . shorten 50
	}
-- Window arrangment and modes --------------------------------------
defaultLayout = tiled ||| Mirror tiled
  where
        -- default tiling agorithm partitions the screen into two panes
        -- with added 2 pixel spacing
        tiled = spacing 2 $ Tall nmaster delta ratio
        -- number of windows in master pane (default 1)
        nmaster = 1 -- mod-, to add and mod-. to remove from master pane
        -- proportios of screen occupied by master pane
        ratio = 1/2
        -- percentage of screen to increment by, when resizing panes (default 3/100)
        delta = 2/100
