#!/usr/bin/dash

# assist: web browser
LIST="$(cat /usr/share/instantassist/data/firefox)"
if [ -e ~/.config/instantos/instantassist/browser ]; then
    LIST="$LIST
$(cat ~/.config/instantos/instantassist/browser)"
fi

LINK="$(echo "$LIST" | instantmenu -ct | sed 's/^.//g')"

[ -z "$LINK" ] && exit

case "$LINK" in
clipboard)
    instantutils open browser "$(xclip -o)"
    ;;
*firefox)
    firefox --private-window
    ;;
*tab)
    instantutils open browser
    ;;
*jump*)
	search="$(imenu -i 'video search')"
	instantutils open browser "$(ytscrape $search | jq -r '.[0].url')";;
*)
    instantutils open browser "$LINK"
    ;;
esac
