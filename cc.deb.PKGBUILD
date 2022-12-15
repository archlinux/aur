source deb.PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Debian package; cross-compile."
_pkgarches=('armhf' 'arm64' 'amd64')
##STATIC CROSS-COMPILATION DEPENDENCIES NOT SATISFIABLE!!!
makedepends=("${makedepends[@]}" "aarch64-linux-musl" "arm-linux-gnueabihf-musl") # 'arm-linux-gnueabihf-binutils' 'aarch64-binutils')

prepare() {
for _i in ${_pkgarches[@]}; do
_msg2 "$_i"
done
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_i} ${srcdir}/go/apps.${_i}
ln -rTsf ${srcdir}/${pkgname}-${pkgver}${_rc} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
local GOPATH=${srcdir}/go
export GOOS=linux
export CGO_ENABLED=1
#loop for crosscompilation
for i in ${_pkgarches[@]}; do
msg2 "_pkgarch=$i"
local _pkgarch=$i
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin.${_pkgarch}
export _GOAPPS=${GOPATH}/apps.${_pkgarch}
export GOOS=linux
#static cross-compilation
[[ $_pkgarch == "amd64" ]] && export GOARCH=amd64 && export CC=musl-gcc
[[ $_pkgarch == "arm64" ]] && export GOARCH=arm64 && export CC=aarch64-linux-musl-gcc
[[ $_pkgarch == "armhf" ]] && export GOARCH=arm && export GOARM=6 && export CC=arm-linux-gnueabihf-musl-gcc
#_ldflags=('-linkmode external -extldflags "-static" -buildid=')
_build
 done
}

package() {
#loop to install crosscompiled binaries
for i in ${_pkgarches[@]}; do
msg2 "_pkgarch=${i}"
local _pkgarch=${i}
GOPATH=${srcdir}/go
GOBIN=${GOPATH}/bin.${_pkgarch}
_GOAPPS=${GOPATH}/apps.${_pkgarch}
_debpkgdir="${_pkgname}-${pkgver}${_rc}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_systemddir="etc/systemd/system"
_skywirebin="skywire-bin/"

[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
_packagedeb
done
if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${pkgdir}
fi
#exit so the arch package doesn't get built
exit
}
sha256sums=('56da81239baefeffd0bb607c4d1d3a1efc2e86e029471892970e531a9c269533'
            'SKIP')
