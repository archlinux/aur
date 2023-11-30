source deb.PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Debian package; cross-compile."
_pkgarches=('armhf' 'arm64' 'amd64')
makedepends=("${makedepends[@]}" "aarch64-linux-musl-cross-bin" "muslcc-arm-linux-musleabihf-cross-bin" "muslcc-arm-linux-musleabi-cross-bin")

prepare() {
for _i in ${_pkgarches[@]}; do
_msg2 "preparing $_i"
[[ -d ${srcdir}/go/bin.${_i} ]] && rm -rf ${srcdir}/go/bin.${_i}
mkdir -p ${srcdir}/go/bin.${_i}
[[ -d ${srcdir}/go/bin.${_i} ]] && rm -rf ${srcdir}/go/apps.${_i}
mkdir -p ${srcdir}/go/apps.${_i}
done
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/
# https://wiki.archlinux.org/index.php/Go_package_guidelines
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
[[ $_pkgarch == "armhf" ]] && export GOARCH=arm && export GOARM=6 && export CC=arm-linux-musleabihf-gcc && source /etc/profile.d/arm-linux-musleabihf-cross.sh /etc/profile.d/arm-linux-musleabi-cross.sh
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
sha256sums=('e05e46b2315e4dea3b843425004e0e501f999b727265f434a60cd3874e2216e9'
            'SKIP'
            '73f3d759c8fa3ff7237d78662bf37f0e886f19879f8c541bfed5e750a1810fc3'
            '891562be2c32a3f8603d812b0569c6035f384196709335debf5b40dbf3726389')
