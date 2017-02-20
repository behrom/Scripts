#!/usr/bin/env python
import dbus
import webbrowser
import re

session_bus = dbus.SessionBus()
spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify",
                                     "/org/mpris/MediaPlayer2")
spotify_properties = dbus.Interface(spotify_bus,
                                    "org.freedesktop.DBus.Properties")
metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

# The property Metadata behaves like a python dict
# for key, value in metadata.items():
#    print key, value

title = metadata['xesam:title']
artist = (metadata['xesam:artist'])[0]

url = "https://www.google.pl/search?q=" + artist + " " + title + " chords"
print url

webbrowser.open(url, new=2);
