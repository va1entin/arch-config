# arch-config

```bash
git clone git@github.com:va1entin/arch-config.git

cd arch-config

./setup-zsh.sh

./setup-zshrc.sh

./install-pkgs.sh

./setup-timers.sh

./setup-docker.sh

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

Change command of shortcut on `Super L`: `xfce4-appfinder` (no collapsed mode)

Add shortcut for `Ctrl+Alt+Down` with command `wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz`

## HiDPI

<https://wiki.archlinux.org/title/HiDPI#Xfce>
<https://wiki.archlinux.org/title/HiDPI#Qt_5>

Display -> General

Set scale to "custom: 1.2"

```bash
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
sudo echo "QT_FONT_DPI=192" >> /etc/environment
```

Display -> Advanced -> Connecting Displays

"When new displays are connected": "Do nothing"

-> Otherwise the display dialogue will open every time the screen turns off while XFCE is running (on every lockscreen basically) and reset scale to 1

## Lock screen

Keyboard -> Application Shortcuts

Add shortcut for `Ctrl+Shift+L` and `Ctrl+Alt+L` with command: `xflock4`

## Mouse and Touchpad (large cursor fix)

**Theme tab**

Increase size, then decrease to 16 again

## Mousepad

View -> Colour Scheme -> Select `Oblivion`

## Night mode

Settings Editor -> night-mode

**Dark**

GtkTheme: Arc-Dark

IconTheme: Arc-X-P

**Light**

GtkTheme: Arc

IconTheme: Arc-X-D

### Automatic switch

Make sure redshift is working by running `redshift -p` and then follow [instructions for Night mode](https://github.com/bimlas/xfce4-night-mode#readme)

## Notifications

Default position: Bottom left

Opacity: 100%

Disappear after: 10 seconds

Fade out: Yes

Slide out: Yes

## Ristretto

Edit -> Preferences -> Behaviour

Uncheck `Maximize window on startup when opening an image`

## Screensaver

**Lock screen tab**

Enable after 0 minutes

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

## Terminal

View -> Preferences

Appearance tab

- Set font to `Monospace Regular` at size `12`

Colours tab

- Select Preset "Tango"
- Set background colour `#171421`
- Set Text colour `#d0cfcc`

## Volume control shortcut

Keyboard -> Application Shortcuts

Add shortcut for `Super+F9 with command: `amixer set Master 5%-`

Add shortcut for `Super+F10 with command: `amixer set Master 5%+`

## Window manager

**Advanced tab**

Wrap workspaces when reaching the screen edge

With a dragged window -> No

## Window manager tweaks

**Cycling tab**

Cycle through windows on all workspaces -> No

**Keyboard tab**

```
Maximize window -> Ctrl+Alt+Up
Tile window to the left -> Alt+Left
Tile window to the right -> Alt+Right
```

## Workspaces

**General tab**

Number of workspaces: 2

# Gnome (archive)

I'm not using Gnome anymore so this chapter represents my last config as of Nov. 2022

## Extensions

```bash
gnome/setup-soft-brightness.sh
```

[Night Theme Switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher/)
