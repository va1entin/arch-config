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

./setup-teamviewer.sh
```

# XFCE

Open Settings Manager and apply the following settings in respective categories

## Application finder

Keyboard -> Application Shortcuts

Add shortcut for `Ctrl+x` and `Super+x` with command: `xfce4-appfinder --quit`

Change command of shortcut on `Super L`: `xfce4-appfinder` (no collapsed mode)

## Mouse and Touchpad (large cursor fix)

**Theme tab**

Increase size, then decrease to 16 again

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

## Screensaver

**Lock screen tab**

Enable after 5 minutes

## Session & Startup

**General tab**

Automatically save session on logout -> No (Delete any saved sessions)

Lock screen before sleep -> Yes

**Make sure to uncheck "Save session for future logins" on logout!**

**Application Autostart tab**

Remove Notes

## Window manager

**Advanced tab**

Wrap workspaces when reaching the screen edge

With a dragged window -> No

## Window manager tweaks

**Cycling tab**

Cycle through windows on all workspaces -> No

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
