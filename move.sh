#! /bin/bash

# komenda ktora przenosi wszystkie okna z danego workspace na inny podany jako argument tutaj (0)
# xdotool search --desktop $(xdotool get_desktop) "" set_desktop_for_window %@ 0

LAST_WORKSPACE=$(($(xdotool get_num_desktops) - 1))

add_workspace_on_top() {
    seq=`seq $(($LAST_WORKSPACE - 1)) -1 0`
    echo $seq
    echo

    for workspace in $seq; do
        xdotool search --desktop $workspace "" set_desktop_for_window %@ $(($workspace+1))
        echo $workspace $LAST_WORKSPACE
    done
}

del_workspace_on_top() {
    seq=`seq 1 1 $LAST_WORKSPACE`
    echo $seq
    echo

    for workspace in $seq; do
        xdotool search --desktop $workspace "" set_desktop_for_window %@ $(($workspace-1))
        echo $workspace $(($workspace-1))
    done
}

if [ "$1" = "add" ]; then
    add_workspace_on_top
elif [ "$1" = "del" ]; then
    del_workspace_on_top
fi
