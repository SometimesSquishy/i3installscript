
#Workspace startup stuff 
#remember to chmod +x scripts and put them in ~/Tools/bin/

# Setup Workspace 1
i3-msg "workspace 1; exec kitty newsboat"
sleep 0.2;
i3-msg "workspace 1; floating disable"
i3-msg "workspace 1; split h"
i3-msg "workspace 1; exec kitty htop"
sleep 0.2;
i3-msg "resize shrink left 200 px"
sleep 0.2;
i3-msg "workspace 1; split v"
i3-msg "workspace 1; exec kitty cbonsai -l --life=40 --multiplier=3 -i"
sleep 0.2;

# Music Setup, Uncomment if dual monitors
# exec bash ~/Tools/bin/muzix.sh

# Back to Workspace 1
i3-msg "workspace 1"

#----------------------------------------#
# General app launch ....                #
#----------------------------------------#

# Launch Bar
exec polybar mystatus -q &
#sleep 0.2; 

# Launch nm-applet
#exec nm-applet &

# Launch Other Random shit
exec redshift -P -O 3400K &
exec watcher --start &

#exec ntfd &
#exec blueman-applet 

