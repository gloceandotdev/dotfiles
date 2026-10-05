#!/bin/bash
# switch-theme.sh — called by dark-notify on appearance change, or manually with "dark"/"light"

CONFIG="$HOME/.config"

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

MODE="${1:-}"
if [ -z "$MODE" ]; then
    if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -qi dark; then
        MODE="dark"
    else
        MODE="light"
    fi
fi

case "$MODE" in
    dark)
        # Sketchybar
        cp "$CONFIG/sketchybar/colors-dark.sh" "$CONFIG/sketchybar/colors.sh"
        sketchybar --reload

        # Starship
        sed -i '' 's/^palette = .*/palette = "meadow"/' "$CONFIG/starship.toml"


        # JankyBorders
        sed -i '' 's/^borders active_color=.*/borders active_color=0xffc1b0e7 inactive_color=0xff3a3245 width=5.0 hidpi=on/' "$CONFIG/yabai/yabairc"
        pkill -x borders 2>/dev/null; sleep 0.2
        nohup /opt/homebrew/bin/borders active_color=0xffc1b0e7 inactive_color=0xff3a3245 width=5.0 hidpi=on >/dev/null 2>&1 &
        ;;

    light)
        # Sketchybar
        cp "$CONFIG/sketchybar/colors-light.sh" "$CONFIG/sketchybar/colors.sh"
        sketchybar --reload

        # Starship
        sed -i '' 's/^palette = .*/palette = "meadow-light"/' "$CONFIG/starship.toml"


        # JankyBorders
        sed -i '' 's/^borders active_color=.*/borders active_color=0xff6d5b90 inactive_color=0xffd9d2e2 width=5.0 hidpi=on/' "$CONFIG/yabai/yabairc"
        pkill -x borders 2>/dev/null; sleep 0.2
        nohup /opt/homebrew/bin/borders active_color=0xff6d5b90 inactive_color=0xffd9d2e2 width=5.0 hidpi=on >/dev/null 2>&1 &
        ;;
esac
