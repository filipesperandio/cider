#!/bin/sh

# To export karabiner settings
# /Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/.cider/scripts/karabiner.sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 20
/bin/echo -n .
$cli set repeat.initial_wait 275
/bin/echo -n .
/bin/echo
