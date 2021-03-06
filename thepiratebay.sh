#!/bin/bash
#
# The Pirate Bay
# http://cixtor.com/
# https://github.com/cixtor/mamutools
# http://cixtor.com/blog/the-pirate-bay-search
# http://thepiratebay.se/
#
# The Pirate Bay is the worlds largest bittorrent tracker. Bittorrent is a file-
# sharing protocol that in a reliable way enables big and fast file transfers.
# This is an open tracker, where anyone can download torrent files. To be able
# to upload torrent files, write comments and personal messages one must register
# at the site. This is of course free.
#
# The members at The Pirate Bay represents a broad spectrum of file sharers.
# Therefore material that seem offensive might be available. Do not contact us
# if there is anything you find offensive, instead focus on the material that
# you find positive. The Pirate Bay only removes torrents if the name isn't in
# accordance with the content. One must know what is being downloaded.
#
# (Accordance with the content also means any torrents which description is made
# to match a certain search phrase that is not relevant will also be deleted).
# Only torrent files are saved at the server. That means no copyrighted and/or
# illegal material are stored by us. It is therefore not possible to hold the
# people behind The Pirate Bay responsible for the material that is being spread
# using the tracker. Any complaints from copyright and/or lobby organizations
# will be ridiculed and published at the site.
#
SEARCH=$(
zenity --entry --title='The Pirate Bay - Search' \
--text='The Pirate Bay
  http://cixtor.com/
  https://github.com/cixtor/mamutools
  http://thepiratebay.se/

Search in the worlds largest bittorrent tracker,
where anyone can upload/download torrent files,
write comments and... Of course: FREE'
)
if [ "${SEARCH}" != "" ]; then
    URL=$(echo "http://thepiratebay.se/search/${SEARCH}/0/7" | sed 's/ /+/g')
    echo "Starting the default web-browser with this URL: ${URL}"
      if [ $(which xdg-open)      ]; then $(which xdg-open) "${URL}"
    elif [ $(which firefox)       ]; then $(which firefox) "${URL}"
    elif [ $(which opera)         ]; then $(which opera) "${URL}"
    elif [ $(which konqueror)     ]; then $(which konqueror) "${URL}"
    elif [ $(which google-chrome) ]; then $(which google-chrome) "${URL}"
      fi
else
    echo 'No string to search in ThePirateBay.se'
fi
#