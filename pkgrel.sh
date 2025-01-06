function pkgrel {
    FLAG=$1
    for f in $(ls PKGBUILD*)
    do
        PKGREL=$(grep -E "^pkgrel=" $f|cut -f2 -d"=")
        if [[ -z $FLAG ]];then
            PKGREL=$((${PKGREL}+1))
        elif [[ "$FLAG" =~ "-" ]];then
            PKGREL=$((${PKGREL}-1))
        else
            PKGREL=1
        fi
        sed -i 's|^pkgrel=.*$|pkgrel='"${PKGREL}"'|' $f
    done
}

pkgrel $1
