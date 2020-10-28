#!/bin/sh
DEV="$1"
MNTPT="$2"
OPTIONS=""
TCOPTIONS=""

shift 3
IFS=','
for arg in $*; do
    case "$arg" in
        system)                   TCOPTIONS=(${TCOPTIONS[*]} --m=system);;
        fs*)                      TCOPTIONS=(${TCOPTIONS[*]} --filesystem=${arg#*=});;
        keyfiles*)                TCOPTIONS=(${TCOPTIONS[*]} --keyfiles=${arg#*=});;
        password*)                TCOPTIONS=(${TCOPTIONS[*]} --password=${arg#*=}) && echo "password triggered" ;;
        protect-hidden*)          TCOPTIONS=(${TCOPTIONS[*]} --protect-hidden=${arg#*=});;
        *)                        OPTIONS="${OPTIONS}${arg},";;

    esac
done

/bin/truecrypt --text --non-interactive ${DEV} ${MNTPT} ${TCOPTIONS[*]} --fs-options="${OPTIONS%,*}"
