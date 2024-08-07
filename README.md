# arch-config

```bash
git clone git@github.com:va1entin/arch-config.git

cd arch-config

./setup-zsh.sh

./setup-zshrc.sh

./install-pkgs.sh

./setup-timers.sh

./setup-configs.sh

./setup-syncthing.sh

# ./setup-teamviewer.sh
```

# LightDM

```bash
yay -S lightdm lightdm-slick-greeter lightdm-settings
```

`/etc/lightdm/slick-greeter.conf `

```
[Greeter]
enable-hidpi=on
```

`systemctl enable lightdm.service`

See [Arch wiki](https://wiki.archlinux.org/title/LightDM)

# XFCE

Open Settings Manager and apply the following settings in respective categories

## Application finder

Keyboard -> Application Shortcuts

Add shortcut for `Ctrl+x` and `Super+x` with command: `xfce4-appfinder --quit`

Add shortcut for `Super L` with command: `xfce4-appfinder` (no collapsed mode)

```bash
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary>x" -t "string" -s "xfce4-appfinder --quit" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>x" -t "string" -s "xfce4-appfinder --quit" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" -t "string" -s "xfce4-appfinder" -n
```

## HiDPI

<https://wiki.archlinux.org/title/HiDPI#Xfce>
<https://wiki.archlinux.org/title/HiDPI#Qt_5>

Display -> General

Set scale to "custom: 1.2"

```bash
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 42
sudo echo "QT_FONT_DPI=192" >> /etc/environment
```

Display -> Advanced -> Connecting Displays

"When new displays are connected": "Do nothing"

-> Otherwise the display dialogue will open every time the screen turns off while XFCE is running (on every lockscreen basically) and reset scale to 1

## Lock screen

Keyboard -> Application Shortcuts

Add shortcut for `Ctrl+Shift+L` and `Ctrl+Alt+L` with command: `xflock4`

```bash
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift>l" -t "string" -s "xflock4" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>l" -t "string" -s "xflock4" -n
```

## Mouse cursor theme

Mouse and Touchpad -> Theme

Set theme Adwaita
```bash
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Adwaita
```

### Large cursor fix

**Theme tab**

Increase size, then decrease to 16 again

## Mousepad

View -> Colour Scheme -> Select `Oblivion`

## Night mode

Settings Editor -> night-mode (channel only appeared at some point after genmon and redshift were set up, not sure why)

**Dark**

GtkTheme: Arc-Dark

IconTheme: Arc-X-P

**Light**

GtkTheme: Arc

IconTheme: Arc-X-D

```bash
xfconf-query -c night-mode -p /Dark/GtkTheme -t "string" -s "Arc-Dark" -n
xfconf-query -c night-mode -p /Dark/IconTheme -t "string" -s "Arc-X-P" -n
xfconf-query -c night-mode -p /Light/GtkTheme -t "string" -s "Arc" -n
xfconf-query -c night-mode -p /Light/IconTheme -t "string" -s "Arc-X-D" -n
```

### Automatic switch

Run `setup-redshift.sh`

Make sure redshift is working by running `redshift -p` and then follow [instructions for Night mode](https://github.com/va1entin/xfce4-night-mode#readme)

## Notifications

**General tab**

Fade out: Yes

Slide out: Yes

**Appearance tab**

Default position: Bottom left

Opacity: 100%

Disappear after: 10 seconds

```bash
xfconf-query -c xfce4-notifyd -p /do-slideout -t "bool" -s "true" -n
xfconf-query -c xfce4-notifyd -p /notify-location -t "string" -s "bottom-left" -n
xfconf-query -c xfce4-notifyd -p /initial-opacity -t "string" -s "1,000000" -n
```

## Panel (Remove bottom panel)

Panel -> Remove panel 2

## Ristretto

Edit -> Preferences -> Behaviour

Uncheck `Maximize window on startup when opening an image`

```bash
xfconf-query -c ristretto -p /window/maximize-on-startup -t "bool" -s "false" -n
```

## Screensaver

**Lock screen tab**

Enable after 0 minutes

```bash
xfconf-query -c xfce4-screensaver -p /saver/mode -t "int" -s 0 -n
```

## Screen brightness shortcut

Keyboard -> Application Shortcuts

Get monitor device path: `ddccontrol -p | grep -Eo 'dev:/dev/[a-z0-9-]*$' | sort -u`

Add shortcut for `Super+F11` with command: `ddccontrol -r 0x10 -W -5 -d dev:/dev/i2c-3`

Add shortcut for `Super+F12` with command: `ddccontrol -r 0x10 -W +5 -d dev:/dev/i2c-3`

## Session & Startup

**General tab**

Automatically save session on logout -> No (Delete any saved sessions)

Lock screen before sleep -> Yes

**Make sure to uncheck "Save session for future logins" on logout!**

**Application Autostart tab**

Remove Notes

```bash
xfconf-query -c xfce4-session -p /general/SaveOnExit -t bool -s "false" -n
xfconf-query -c xfce4-session -p /shutdown/LockScreen -t "bool" -s "true" -n
```

## Terminal

Edit -> Preferences

**Appearance tab**

- Set font to `Monospace Regular` at size `12`

**Colours tab**

- Select Preset "Tango"
- Set background colour `#171421`
- Set Text colour `#d0cfcc`

## Volume control shortcut

Keyboard -> Application Shortcuts

Add shortcut for `Super+F9 with command: `amixer set Master 5%-`

Add shortcut for `Super+F10 with command: `amixer set Master 5%+`

## Window manager

**Keyboard tab**

```
Maximize window -> Ctrl+Alt+Up (because of Alt+Up shortcut in VSC)
Hide window -> Ctrl+Alt+Down (because of Alt+Down shortcut in VSC)
Tile window to the left -> Alt+Left
Tile window to the right -> Alt+Right
```

```bash
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Alt>Up" -s "maximize_window_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Alt>Down" -s "hide_window_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>Left" -t "string" -s "tile_left_key" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>Right" -t "string" -s "tile_right_key" -n
```

**Advanced tab**

Wrap workspaces when reaching the screen edge

With a dragged window -> No

```bash
xfconf-query -c xfwm4 -p /general/wrap_windows -s "false"
```

## Window manager tweaks

**Cycling tab**

Cycle through windows on all workspaces -> No

```bash
xfconf-query -c xfwm4 -p /general/cycle_workspaces -s "false"
```

## Workspaces

**General tab**

Number of workspaces: 2

```bash
xfconf-query -c xfwm4 -p /general/workspace_count -s 2
```

# Gnome (archive)

I'm not using Gnome anymore so this chapter represents my last config as of Nov. 2022

## Extensions

```bash
gnome/setup-soft-brightness.sh
```

[Night Theme Switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher/)
