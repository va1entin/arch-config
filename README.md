# arch-config

```bash
git clone git@github.com:va1entin/arch-config.git

cd arch-config

./setup-zsh.sh

./setup-zshrc.sh

./install-pkgs.sh

./setup-timers.sh

./setup-bootctl.sh

./setup-configs.sh

./setup-syncthing.sh

# ./setup-teamviewer.sh
```

# LightDM

```bash
sudo cp ~/Sync/Wallpaper/1596997155092.jpg /usr/share/endeavouros/backgrounds/
sudo chown root:root /usr/share/endeavouros/backgrounds/1596997155092.jpg
sudo cp configs/slick-greeter.conf /etc/lightdm/
sudo chown root:root /etc/lightmd/slick-greeter.conf
```

## HiDPI

Add to `/etc/lightmd/slick-greeter.conf`

```
[Greeter]
enable-hidpi=on
```

See [Arch wiki](https://wiki.archlinux.org/title/LightDM)

# XFCE 4.20

Open Settings Manager and apply the following settings in respective categories

## Application finder

Keyboard -> Application Shortcuts

Add shortcut for `Super L` with command: `xfce4-appfinder` (no collapsed mode)

```bash
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" -t "string" -s "xfce4-appfinder" -n
xfconf-query -c xfce4-appfinder -p /close-on-focus-lost -t "bool" -s "true" -n
xfconf-query -c xfce4-appfinder -p /hide-window-decorations -t "bool" -s "true" -n
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

## Keyboard remapping

To enable <, > and | symbols on Ctrl+i, o and p for QWERTY keyboards with German layout on X11:

```bash
yay -S xdotool

xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary>i" -t "string" -s "sh -c 'sleep 0.2 ; xdotool type \"<\"'" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary>o" -t "string" -s "sh -c 'sleep 0.2 ; xdotool type \">\"'" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary>p" -t "string" -s "sh -c 'sleep 0.2 ; xdotool type \"|\"'" -n
```

For Wayland see [wtype](https://github.com/atx/wtype) or the [Arch wiki](https://wiki.archlinux.org/title/Input_remap_utilities).

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

## Power Manager

```bash
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-battery -t "int" -s 1 -n
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-sleep-mode-on-battery -t "int" -s 1 -n
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-ac -t "int" -s 1 -n
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-sleep-mode-on-ac -t "int" -s 1 -n
```

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
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Alt>Up" -t string -s "maximize_window_key" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Alt>Down" -t string -s "hide_window_key" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Alt>Left" -t "string" -s "tile_left_key" -n
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Alt>Right" -t "string" -s "tile_right_key" -n
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
xfconf-query -c xfwm4 -p "/general/cycle_workspaces" -t "bool" -s "false" -n
xfconf-query -c xfwm4 -p "/general/scroll_workspaces" -t "bool" -s "false" -n
```

## Workspaces

**General tab**

Number of workspaces: 2

```bash
xfconf-query -c xfwm4 -p /general/workspace_count -s 2
```
