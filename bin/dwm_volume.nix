        {pkgs, ...}:

        let dwmVolume = pkgs.writeShellScriptBin "dwm_volume" ''
        vol=$(pactl list sinks | perl -000ne 'if(/#1/){/(Volume:.*)/; print "$1\n"}' | tr ' ' '\n' | grep -m1 '%' | tr -d '%')
        if [ -z "$vol" ]; then
                vol=$(pactl list sinks | tr ' ' '\n' | grep -m1 '%' | tr -d '%')
        fi

        vol_status=$(pactl list sinks | grep 'Mute: yes')

        if [ -n "$vol_status" ]
        then
                vol_icon=" "
        elif [ ${vol::-1} -eq 0 ]
        then
                vol_icon=" "
        elif [ ${vol::-1} -lt 50 ]
        then
                vol_icon=" "
        else
                vol_icon=" "
        fi

        printf "$vol_icon^c#f7ca88^$vol%%^d^"
        '';

        in {
          home.packages = [ dwmVolume ];
        }
