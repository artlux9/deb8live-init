#!/bin/bash
#
# Author: Art Lux
# Copyright: Art Lux 2015
# Info: Debian 8 live user customization script.

#gnome privacy
gsettings set org.gnome.desktop.privacy hide-identity true;
gsettings set org.gnome.desktop.privacy old-files-age 0;
gsettings set org.gnome.desktop.privacy remember-app-usage false;
gsettings set org.gnome.desktop.privacy remember-recent-files false;
gsettings set org.gnome.desktop.privacy remove-old-temp-files true;
gsettings set org.gnome.desktop.privacy remove-old-trash-files true;
gsettings set org.gnome.desktop.privacy send-software-usage-stats false;

#timezone
gsettings set org.gnome.desktop.datetime automatic-timezone true;

#clock
gsettings set org.gnome.desktop.interface clock-format 12h;
gsettings set org.gnome.desktop.interface clock-show-date true;

#launcher
gsettings set org.gnome.shell favoriate-apps "['google-chrome.desktop', 'gnome-terminal,desktop', 'gedit.desktop', 'nautilus.desktop', 'iceweasel.desktop', 'gnome-calculator.desktop']"

#monospace
gsettings set org.gnome.desktop.interface monospace-font-name "Monospace 9";

#global dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark";

#background
gsettings set org.gnome.desktop.background color-shading-type "solid";
gsettings set org.gnome.desktop.background picture-uri "";
gsettings set org.gnome.desktop.background primary-color "#000";

#cursor size
gsettings set org.gnome.desktop.interface cursor-size 32;

#screensaver lock
gsettings set org.gnome.desktop.screensaver lock-enabled false;

#gedit
gsettings set org.gnome.gedit.preferences.editor auto-indent true;
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true;
gsettings set org.gnome.gedit.preferences.editor use-default-font false;
gsettings set org.gnome.gedit.preferences.editor editor-font "Monospace 9";
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true;
gsettings set org.gnome.gedit.preferences.editor scheme cobalt;
gsettings set org.gnome.gedit.preferences.editor tabs-size 2;
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none';

#simple-scan
gsettings set org.gnome.SimpleScan jpeg-quality 100;
gsettings set org.gnome.SimpleScan photo-dpi 2400;
gsettings set org.gnome.SimpleScan page-side front;


#install adblock (firefox/iceweasel)
firefox https://update.adblockplus.org/latest/adblockplusfirefox.xpi;

#install noscript (firefox/iceweasel)
firefox https://addons.mozilla.org/en-US/firefox/downloads/latest/722/addon-722-latest.xpi;

#adblock
google-chrome https://chrome.google.com/webstore/detail/cfhdojbkjhnklbpkdaibdccddilifddb

#ublock origin
google-chrome https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
#ublock
#google-chrome https://chrome.google.com/webstore/detail/ublock/epcnnfbjfcgphgdmggkamkmgojdagdnn

#random hide user-agent
google-chrome https://chrome.google.com/webstore/detail/random-hide-user-agent/einpaelgookohagofgnnkcfjbkkgepnp

