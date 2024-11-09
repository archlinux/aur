function pkgrel {
    FLAG=$1
    for f in $(ls PKGBUILD*)
    do
        PKGREL=$(grep -E "^pkgrel=" $f|cut -f2 -d"=")
        [[ -z $FLAG ]] && PKGREL=$((${PKGREL}+1)) || PKGREL=1
        sed -i 's|^pkgrel=.*$|pkgrel='"${PKGREL}"'|' $f
    done
}

pkgrel $1
