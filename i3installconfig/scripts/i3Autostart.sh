
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
sleep 0.1;

# Setup Workspace 2
#i3-msg "workspace 2; floating disable"
#i3-msg "workspace 2; split h"
#sleep 0.5;

#Setup Workspace 3
#i3-msg "workspace 3; exec kitty alsamixer"
#sleep 0.5;
#i3-msg "workspace 3; floating disable"
#i3-msg "workspace 3; split h"
#i3-msg "workspace 3; exec kitty cmus"
#sleep 0.5;
#i3-msg "workspace 3; floating disable"
#i3-msg "workspace 3; split v"
#i3-msg "workspace 3; exec kitty cava"
#sleep 0.5;
#i3-msg "workspace 3; floating disable"
#for i in {1..6}
#do
#    i3-msg "resize grow left 200 px"
#    i3-msg "resize shrink up 72 px"
#done
#i3-msg "resize grow left 32 px"
#sleep 0.2;


# Back to Workspace 1
#i3-msg "workspace 1"

#----------------------------------------#
# General app launch ....                #
#----------------------------------------#

# Launch Bar
#exec polybar mystatus -q &
#sleep 0.2; 

# Launch nm-applet
#exec nm-applet &

# Launch Other Random shit
exec redshift -P -O 3400K &
exec watcher --start &

#exec ntfd &
#exec blueman-applet 

