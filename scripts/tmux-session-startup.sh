#!/usr/bin/env zsh

if [ ! -f /tmp/startup_fixes_run ]; then
    #if running xfce
    if $(which xfce4-about > /dev/null 2>&1); then
        # disable do not disturb
        xfconf-query -c xfce4-notifyd -p /do-not-disturb -t "bool" -s "false"
    fi

    case "$(hostname)" in
    val)
        # set screen as audio output
        speaker_id=$(pw-dump -N | jq '.[] | select((.info.props["media.class"]) == "Audio/Sink" and (.info.props["node.description"]) == "TU116 High Definition Audio Controller Digital Stereo (HDMI)") | .id')
        if [ -n "$speaker_id" ]; then
            sleep 10
            wpctl set-default $speaker_id
        fi

        # fix for sometimes extremely loud volume on desktop startup
        amixer set Master 1%- > /dev/null

        # clear yay and paccache
        yaycache -r -q --remove-build-files -k0
        paccache -q -r -k 0
        yay
        ;;
    esac

    touch /tmp/startup_fixes_run
fi
