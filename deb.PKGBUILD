# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Develop Banch. Debian package"
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
#leave arch package as any
arch=('any')
#manually version for now
pkgver='0.5.1'
_pkgver=${pkgver}
pkgrel=1
_pkgrel=${pkgrel}
#pkgrel=1
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
license=()
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl')
depends=()
_debdeps=""
#_debdeps="reprepro"
_scripts="skywire-deb-scripts"
#source=("git+${url}.git#branch=${BRANCH:-develop}"
source=( "${url}/archive/refs/tags/v${pkgver}.tar.gz"
"${_scripts}.tar.gz"  )
sha256sums=('f76bba50525c2057a9aba5d3a1fe95d1913890a19bc7ad2ff9113b278bf8d489'
            'f993e28400f72a05500f0b091d6d308c5a4a1299a2490ff0ecb5b59b0805e5b1')

#tar -czvf skywire-deb-scripts.tar.gz skywire-deb-scripts
#updpkgsums deb.PKGBUILD

prepare() {
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
	mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_pkgarch} ${srcdir}/go/apps.${_pkgarch}
  ln -rTsf ${srcdir}/${_pkgname}-${_pkgver} ${srcdir}/go/src/${_pkggopath}
  ln -rTsf ${srcdir}/${_pkgname}-${_pkgver} ${srcdir}/${_pkgname}
  cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
local GOPATH=${srcdir}/go
local GOBIN=${GOPATH}/bin
local _GOAPPS=${GOPATH}/apps
local GOOS=linux
export CC=musl-gcc

#create read only cache binary
cd ${srcdir}/${_scripts}/skycache
go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ skycache.go

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
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)

### CONTROL FILES CREATION ###
#create control file for the debian package
echo "Package: skywire" > ${srcdir}/control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
echo "Priority: optional" >> ${srcdir}/control
echo "Section: web" >> ${srcdir}/control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
echo "Depends: ${_debdeps}" >> ${srcdir}/control
echo "Maintainer: github.com/the-skycoin-project" >> ${srcdir}/control
echo "Description: ${pkgdesc}" >> ${srcdir}/control

}

#speed up the build for testing - there's a risk of using old binaries.
_buildbins() {
_GOHERE=$2  #target bin dir
_binpath=$3   #find the binary here- expecting 'apps/' or empty
_binname=$1 #which binary to build
_msg2 "building ${_binname} binary"
if [[ ! -f ${_GOHERE}/${_binname} ]] ; then #don't waste time rebuilding existing bins
	cd ${_cmddir}/${_binpath}${_binname}
  go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $_GOHERE/ .
fi
}


package() {
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${_pkgdir}/usr/bin
#this was done at my discretion for tls autoconfig
mkdir -p ${_pkgdir}/${_skydir}/ssl
#the skeleton of the hyperviorkey package; created with a script run on target machines
mkdir -p ${_pkgdir}/${_skydir}/hypervisorkey/opt/${_pkgname}
#other dirs must be created or the visor will create them at runtime with weird permissions
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/dmsgpty
mkdir -p ${_pkgdir}/${_skydir}/${_pkgname}    #needed?
mkdir -p ${_pkgdir}/${_skydir}/skycache    #local package repository
mkdir -p ${_pkgdir}/${_skydir}/transport_logs
mkdir -p ${_pkgdir}/${_skydir}/scripts

cd $_pkgdir

_msg2 'installing binaries'
#loop to install the binaries
_skywirebins=$( ls ${srcdir}/go/bin )
for i in ${_skywirebins}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/bin/${i} ${_skybin}
done

_msg2 'installing apps'
#loop to install the apps
_skywireapps=$( ls ${srcdir}/go/apps )
for i in ${_skywireapps}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/apps/${i} ${_skyapps}
done


_msg2 'installing scripts'
_skywirescripts=$( ls ${srcdir}/${_scripts}/${_pkgname} )
for i in ${_skywirescripts}; do
  _install2 ${srcdir}/${_scripts}/${_pkgname}/${i} ${_skyscripts}
done

_msg2 'renaming skywire-visor to skywire'
mv ${_pkgdir}/usr/bin/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

_msg2 'installing skywire systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service

_msg2 'installing tls key and certificate generation scripts'
#install -Dm755 ${srcdir}/${_pkgname}/static/skywire-manager-src/ssl/generate-1.sh ${pkgdir}/${_skydir}/ssl/generate.sh
install -Dm755 ${srcdir}/${_scripts}/ssl/generate.sh ${_pkgdir}/${_skydir}/ssl/generate.sh
ln -rTsf ${_pkgdir}/${_skydir}/ssl/generate.sh ${_pkgdir}/usr/bin/skywire-tls-gen
install -Dm644 ${srcdir}/${_pkgname}/static/skywire-manager-src/ssl/certificate.cnf ${pkgdir}/${_skydir}/ssl/certificate.cnf
#install -Dm644 ${srcdir}/${_scripts}/ssl/certificate.cnf ${_pkgdir}/${_skydir}/ssl/certificate.cnf

_msg2 'installing skywire control file, postinst & postrm scripts'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control
install -Dm755 ${srcdir}/${_scripts}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
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
