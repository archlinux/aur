#!/bin/bash -e

unset asroot
if test 0"$ASROOT" = 01; then
    asroot=--asroot
fi

export ABSROOT=$(readlink -f abs)
mkdir -p "$ABSROOT"

mkdir -p overlay
pacman -Qql linux-api-headers | bsdcpio -o | bsdtar -C overlay -xf -
OVERLAY=$(readlink -e overlay)
qOVERLAY=$(printf %q "$OVERLAY")

OPTIONS=( \
    $(printf "%s\n" $(. "${MAKEPKG_CONF:-/etc/makepkg.conf}" \
         && echo ${OPTIONS[@]}) \
    | grep -vx '!\?staticlibs'))
OPTIONS+=(staticlibs)
sed -e '/^OPTIONS=([^)]*$/,/)/d;/^OPTIONS=(.*)$/d' \
    -e '/^PKGDEST=/d' \
    -e '/^BUILDDIR=/s/^/#/' \
    "${MAKEPKG_CONF:-/etc/makepkg.conf}" > makepkg.conf
cat >> makepkg.conf <<EOF
OPTIONS=(${OPTIONS[@]})
CPPFLAGS="-isystem $qOVERLAY/usr/include \$CPPFLAGS"
LDFLAGS="-L$qOVERLAY \$LDFLAGS"
EOF
export MAKEPKG_CONF=$(readlink -e makepkg.conf)
MAKEFLAGS=$(. "$MAKEPKG_CONF"; printf %s "$MAKEFLAGS")

mkdir -p packages
PKGDEST="$(readlink -e packages)"
echo "PKGDEST=\"$PKGDEST\"" >> makepkg.conf

REBUILD=(core/glibc
         core/openssl core/attr core/acl
         core/expat core/xz core/lzo core/bzip2 core/libarchive
         core/libgpg-error core/libassuan core/gpgme
	 core/libssh2 core/curl)

abs ${REBUILD[@]} core/pacman

add_option() {
    local target="$ABSROOT/$1/PKGBUILD" opt
    shift
    for opt in "$@"; do
	egrep -q -e "^\b[^#]*$opt\b" "$target" || \
	    sed -i -e "/^[ 	]*[^# 	]*\/configure /s//&$opt /" "$target"
    done
}

add_option core/glibc --enable-static-nss
add_option core/libassuan --enable-static
add_option core/libgpg-error --enable-static
add_option core/curl --without-gnutls --without-librtmp --without-gssapi
add_option core/libarchive --without-nettle

sed -ie 's/ make$/ make \${MAKEFLAGS}/' \
    "$ABSROOT/core/"glibc/PKGBUILD

# Stack protector and static-nss don't interact well
fgrep -q 'CFLAGS=${CFLAGS/-fstack-protector/}' "$ABSROOT/core/"glibc/PKGBUILD \
    || sed -ie '/CFLAGS=${CFLAGS\/-fstack-protector-strong\/}/a\  CFLAGS=${CFLAGS/-fstack-protector/}' \
                "$ABSROOT/core/"glibc/PKGBUILD

sed -i -e "/^options=/s/'debug'/'!debug'/" \
    "$ABSROOT/core/"{libarchive,curl}/PKGBUILD

sed -i -e "/^options=/s/'debug'/'!debug'/" \
    "$ABSROOT/core/"{libarchive,curl}/PKGBUILD

sed -i -e '/^ *--with-gssapi *\\$/d' \
    -e 's/--with-libidn/--without-libidn/' \
    "$ABSROOT/core/"curl/PKGBUILD

sed -i -e '/^[	 ]*make test *\(#\|$\)/s/^/#/' \
     "$ABSROOT/core/"{bzip2,lzo,openssl}/PKGBUILD

for pkg in core/gpgme core/libssh2; do
    egrep -q '\./configure.*--disable-shared' "$ABSROOT/$pkg"/PKGBUILD \
	|| sed -i -e '/\.\/configure\>/{
                      s/--disable-static//;
                      s/\( *\\\|\)$/ --disable-shared --enable-static\1/ }' \
			  "$ABSROOT/$pkg/"PKGBUILD
done

sed -i -e '/^ *rm .*\.a$/s/^/#/' "$ABSROOT/"core/attr/PKGBUILD

egrep -q '^ *install .* libbz2.a' "$ABSROOT/core/"bzip2/PKGBUILD || \
    sed -i -e '/^ *install .* libbz2\.so/s|$|\n  install -m644 libbz2.a $pkgdir/usr/lib|' \
    "$ABSROOT/core/"bzip2/PKGBUILD

for pkg in "${REBUILD[@]}"; do
    echo "* Entering $ABSROOT/$pkg"
    cd "$ABSROOT/$pkg"
    makepkg $asroot --skippgpcheck --nocheck --pkg "${pkg##*/}" || :
    bsdtar -C "$OVERLAY" -xpf "$PKGDEST/${pkg##*/}-"*.pkg.tar.* '[!.]*'
done

cd "$ABSROOT/core/pacman"
makepkg $asroot --skippgpcheck -o
if test -z "$BUILDDIR"; then
    cd src/pacman-*
else
    cd "$BUILDDIR"/pacman/src/pacman-*
fi
autoreconf -f -i || :
./configure --disable-shared --disable-doc \
       --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
       --with-scriptlet-shell=/usr/bin/bash \
       --with-ldconfig=/usr/bin/ldconfig \
       LDFLAGS="-static" \
       LIBS="-L$qOVERLAY/usr/lib -lz -lgpg-error -lassuan -lssl -lcrypto \
         -lssh2 -ldl -lstdc++ -lpthread" \
       CPPFLAGS="-isystem $qOVERLAY/usr/include"
make $MAKEFLAGS AM_LDFLAGS=-all-static
install -sD src/pacman/pacman "$OVERLAY/usr/bin/pacman-static"
