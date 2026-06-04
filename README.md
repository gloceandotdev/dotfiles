# Welcome to my home!

<img src="https://github.com/gloceansh/dotfiles/blob/main/assets/desktop.png?raw=true" alt="Desktop" align="right" width="340px">

This is my personal collection of dotfiles for my macOS setup, which is focused on a minimal, elegant, keyboard-driven workflow.

Here’s an overview of my current setup:

- **Operating System**: [macOS Tahoe](https://www.apple.com/os/macos/)
- **Window Manager**: [yabai](https://github.com/koekeishiya/yabai)
- **App Borders**: [JankyBorders](https://github.com/FelixKratz/JankyBorders)
- **Hotkeys**: [skhd](https://github.com/koekeishiya/skhd)
- **Status Bar**: [Sketchybar](https://github.com/FelixKratz/SketchyBar)
- **Terminal**: [ghostty](https://github.com/mitchellh/ghostty)
- **Shell**: [fish](https://fishshell.com/)
- **Prompt**: [starship](https://starship.rs/)
- **Resource Monitor**: [btop](https://github.com/aristocratos/btop)

These dotfiles aim to recreate a tiling WM workflow on macOS, closest in spirit to dynamic tilers on Linux like Awesome and xmonad.

## Details

### Color Scheme

The color scheme is [Rosé Pine](https://rosepinetheme.com/) for dark mode and Rosé Pine Dawn for light mode. The setup automatically follows the macOS system appearance, switching themes triggers `switch-theme.sh` via [dark-notify](https://github.com/cormacrelf/dark-notify), which updates Sketchybar, Starship, Fish, and JankyBorders. The rest changes the theme by itself.

### Sketchybar Weather

For the sketchybar weather plugin to work properly, you have to create an account and get an API key from [OpenWeather](https://openweathermap.org/api). After signing up, go grab your API key [here](https://home.openweathermap.org/api_keys) and paste it into `~/.config/sketchybar/sketchybar_env`. The contents of the file should be like the following:

```bash
export API_KEY="your_api_key_here"
```

> [!NOTE]
> After creating your account, your API key might not work right away. Wait about 20-30 minutes for it to activate.

### Fonts

- **System/Interface Font**: [SF Pro](https://developer.apple.com/fonts/)
- **Monospace Font**: [Jetbrains Mono Nerd](https://www.programmingfonts.org/#jetbrainsmono)

Additionally, my sketchybar config uses [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font) for the app icons on the left of the bar, and [SF Symbols](https://developer.apple.com/sf-symbols/) for the icons on the right.

### Keyboard Shortcuts

I highly suggest binding `capslock` to `control + option + command` using [Karabiner-Elements](https://karabiner-elements.pqrs.org/), since that combination of keys is used as the modifier key for my yabai/skhd config. After installing, go to Complex Modifications -> Add Your Own rule -> And paste the following:
```
{
    "description": "Caps lock key -> hyper key without shift (⌘⌥⌃), Escape when tapped",
    "manipulators": [
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": { "optional": ["any"] }
            },
            "to": [
                {
                    "key_code": "left_command",
                    "modifiers": ["left_option", "left_control"]
                }
            ],
            "to_if_alone": [{ "key_code": "escape" }],
            "type": "basic"
        }
    ]
}
```

On top of that, pressing capslock normally will register it as the `esc` key, which is useful for vim users.

Below is an overview of the most important keyboard shortcuts.

| Shortcut | Action |
|---|---|
| `capslock + h` / `capslock + j` / `capslock + k` / `capslock + l` | Move focus left / down / up / right |
| `shift + capslock + h` / `shift + capslock + j` / `shift + capslock + k` / `shift + capslock + l` | Move window left / down / up / right |
| `capslock + 1, 2, 3, ...` | Focus space 1, 2, 3, ... |
| `shift + capslock + 1, 2, 3, ...` | Move window to space 1, 2, 3, ... and focus it |
| `capslock + q` / `capslock + w` | Focus monitor 1 / 2 |
| `shift + capslock + q` / `shift + capslock + w` | Move window to monitor 1 / 2 and focus it |
| `capslock + u` / `capslock + i` / `capslock + o` / `capslock + p` | Resize windows left / down / up / right |

For a complete list, please check out the skhd config file.

## Installation

Clone this repository to `~/.config`, then run the setup script:

```bash
git clone https://github.com/gloceansh/dotfiles.git ~/.config
bash ~/.config/setup.sh
```

The script installs all dependencies via Homebrew, sets fish as the default shell, configures the yabai scripting addition, and sets up the dark-notify LaunchAgent for automatic theme switching.

> [!NOTE]
> SIP must be partially disabled for yabai's scripting addition to work. See the [yabai wiki](https://github.com/asmvik/yabai/wiki/Disabling-System-Integrity-Protection) for instructions. After upgrading yabai, re-run the sudoers section of `setup.sh`.
