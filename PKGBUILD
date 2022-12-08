

# Manually written

pkgname='rpkdev'
uniq='tssoftware:rpkg'
appname='RPkgDev'
alias='RPkgDev'
pkgdesc='.rpk package build tool'
author='TS'
type='library'
pkgver='1.0.0'
platforms=( 'all' )
deps=( )
groups=( 'Developer/Packaging' 'CLI/Tool/PackageManager' )
pkgdir='/tmp/tmp.HVYWDJPZSf/sh/pkg'
pkgrel=1

arch=(  'any' )

depends=( conquery )
makedepends=( )
source=( "https://content.tssoftware.eu/binary/rpkdev" )
noextract=( "rpkdev" )

sha256sums=( "SKIP" )

prepare() {
    cd "${srcdir}"
#     sha256sum -c checksums.sha256
}

build() {
    echo -n
#     if [ "$remote" == 1 ]; then
#         echo "srcdir: $srcdir"
#         echo "pkgname: $pkgname"
#         getpkg "$uniq" "$pkgname" "$srcdir"
#     fi
#     [ -f Makefile ] && make -j 4 || ninja
}
package() { 
    targ="$pkgdir/usr/bin"
    mkdir -p "$targ"
    mv "$(realpath rpkdev)" "$targ"
    chmod -R 755 "$targ"
#     echo "Packaging of tspkg started."
#     if [ "$remote" == 1 ]; then
#         projdir="$srcdir"
#     fi
#     cd "$projdir/"
# #     echo "PWD: $PWD"
#     for((i = 0; i < ${#contents[@]}; i++)); do
# #         echo "#contents: ${#contents[@]}"
#         IFS="<" read -a sp <<< "${contents[$i]}"
# #         echo "#contents: ${#contents[@]}"
#
# #         echo ln -sf "$(trimstr "${sp[1]}")}" "$pkgdir/$(tspkg_convpath "$(trimstr "${sp[0]}")")"
#         inpkg_path="$(tspkg_convpath <<< "$(trimstr "${sp[0]}")")"
#         mkdir -p "$pkgdir/$(dirname "$inpkg_path")"
#         cp -R "$(realpath "$(trimstr "${sp[1]}")")" "$pkgdir/$inpkg_path"
#     done
}        



