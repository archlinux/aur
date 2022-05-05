_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Debian package; cross-compile."
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.6.0
pkgrel=5
#pkgrel=5
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
arch=('any')
_pkgver=${_pkgver}
_pkgrel=${_pkgrel}
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl') # 'arm-linux-gnueabihf-binutils' 'aarch64-binutils') #'aarch64-linux-musl' 'arm-linux-gnueabihf-musl' 'skycoin-keyring')
_debdeps=""
install=skywire.install
_scripts="skywire-deb-scripts"
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
"${url}/raw/develop/dmsghttp-config.json"
"${_scripts}.tar.gz"
)
sha256sums=('f1c6ae2dbe36cda0767855ac1b8676751358ca782e2c3d8ee16ba9b0de9b2bc3'
            'dcb3b8bc1f6fa58dd64b95045b8b010489352c815f737bf2cbf8812973a8dc49'
            '1ff213945f7c009572f71fdf00aea28c464996fbc4bf946b03c8787ac0cd47d9')
#tar -czvf skywire-deb-scripts.tar.gz skywire-deb-scripts
#updpkgsums deb.PKGBUILD

prepare() {
  for i in ${_pkgarches[@]}; do
  _msg2 "$i"
done
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
	mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_pkgarches[@]} ${srcdir}/go/apps.${_pkgarches[@]}
  ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
  cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
  local GOPATH=${srcdir}/go
  export GOOS=linux
  export CGO_ENABLED=1

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
    #create the skywire binaries
    cd ${srcdir}/go/src/${_pkggopath}
    _cmddir=${srcdir}/go/src/${_pkggopath}/cmd

    _buildbins skychat $_GOAPPS apps/
    _buildbins skysocks $_GOAPPS apps/
    _buildbins skysocks-client $_GOAPPS apps/
    _buildbins vpn-client $_GOAPPS apps/
    _buildbins vpn-server $_GOAPPS apps/
    _buildbins skywire-visor $GOBIN
    _buildbins skywire-cli $GOBIN
    _buildbins setup-node $GOBIN

    #binary transparency
    cd $GOBIN
    _msg2 'binary sha256sums'
    echo -e "$_pkgarch"
    sha256sum $(ls)
    cd $_GOAPPS
    sha256sum $(ls)

    _msg2 'creating the DEBIAN/control files'
    #create control file for the debian package
    echo "Package: skywire" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: github.com/the-skycoin-project" >> ${srcdir}/${_pkgarch}.control
    echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
  done
}

#had to speed up the build for testing - there's a risk of using old binaries.
_buildbins() {
_GOHERE=$2  #target bin dir
_binpath=$3   #find the binary here- expecting 'apps/' or empty
_binname=$1 #which binary to build
_msg2 "building ${_binname} binary"
	cd ${_cmddir}/${_binpath}${_binname}
  go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o ${_GOHERE}/${_binname} .
}


package() {
for i in ${_pkgarches[@]}; do
msg2 "_pkgarch=${i}"
local _pkgarch=${i}
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skybin="${_skydir}/bin"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts

cd $_pkgdir

_msg2 'installing binaries'
#loop to install the binaries
_skywirebins=$( ls ${srcdir}/go/bin.${_pkgarch} )
for i in ${_skywirebins}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/bin.${_pkgarch}/${i} ${_skybin}
done

_msg2 'installing apps'
#loop to install the apps
_skywireapps=$( ls ${srcdir}/go/apps.${_pkgarch} )
for i in ${_skywireapps}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/apps.${_pkgarch}/${i} ${_skyapps}
done

_msg2 'installing scripts'
_scripts1=${srcdir}/${_scripts}/${_pkgname}
_skywirescripts=$( ls "${_scripts1}" )
for i in ${_skywirescripts}; do
  _install2 ${_scripts1}/${i} ${_skyscripts}
done

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

#install dmsghttp-config.json
install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service
#this is to overwrites any previous file not provided by this package
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}-hypervisor.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig-remote.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig-remote.service

_msg2 'installing desktop files and icon'
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/skywire.png ${_pkgdir}/${_skydir}/icon.png
mkdir -p ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
ln -rTsf ${_pkgdir}/${_skydir}/icon.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png

_msg2 'installing control file and install scripts'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/${_scripts}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/${_scripts}/prerm.sh ${_pkgdir}/DEBIAN/prerm
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
#create the debian package!
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
}

_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${_pkgdir}/${2}/${_binname}
ln -rTsf ${_pkgdir}/${2}/${_binname} ${_pkgdir}/usr/bin/${_binname}
chmod +x ${_pkgdir}/usr/bin/${_binname}
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
