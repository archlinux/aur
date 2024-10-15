    for f in $(ls PKGBUILD*)
    do
        PKGREL=$(grep -E "^pkgrel=" $f|cut -f2 -d"=")
        PKGREL=$((${PKGREL}+1))
        sed -i 's|^pkgrel=.*$|pkgrel='"${PKGREL}"'|' $f
    done
