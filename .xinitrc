
compton --config ~/.compton.conf -b
xmodmap .keyswap
xrdb -merge ~/.Xresources
feh --bg-scale ~/.config/background.png

exec xmonad

