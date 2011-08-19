
setxkbmap -layout lv -variant apostrophe
xmodmap .keyswap
xrdb -merge ~/.Xresources
exec ck-launch-session xmonad
