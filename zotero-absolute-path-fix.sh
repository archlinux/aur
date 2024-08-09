#! /bin/sh

sed -E "s;^CALLDIR.*$;;" -i zotero
sed -E "s;^\"\$CALLDIR.*;exec \"/usr/lib/zotero/zotero-bin\" -app \"/usr/lib/zotero/app/application.ini\" \"\$@\";" -i zotero
sed -E "s;^Exec=.*$;Exec=/usr/lib/zotero/zotero -url %U;" -i zotero.desktop


