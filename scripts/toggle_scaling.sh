#!/usr/bin/env bash

restart_xfce_session=false

# get -r cli parameter from user
while getopts ":r" opt; do
    case ${opt} in
        r )
            restart_xfce_session=true
            ;;
        \? )
            echo "Usage: toggle_scaling.sh [-r]"
            echo "Options:"
            echo "  -r  Restart the XFCE session after toggling scaling"
            exit 1
            ;;
    esac
done

display_connected=$(xrandr --query | grep -w connected | grep -v eDP-1)

if [ -n "$display_connected" ]; then
    xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
    echo "Set window scaling factor to xhdpi default 2"

    xfconf-query -c xfwm4 -p /general/theme -s "Default-xhdpi"
    echo "Set xfwm theme to xhdpi default"

    xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 42
    echo "Set cursor size to xhdpi default 42"
else
    xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
    echo "Set window scaling factor to normal-dpi default 1"

    xfconf-query -c xfwm4 -p /general/theme -s "Default"
    echo "Set xfwm theme to normal-dpi default"

    xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 16
    echo "Set cursor size to normal-dpi default 16"
fi

if [ "$restart_xfce_session" == true ]; then
    xfce4-panel -r
    echo "XFCE session restarted"
fi