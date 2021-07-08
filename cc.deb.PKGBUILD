# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>

# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
#t.me/Skycoin for inquiries
_pkgname=skycoin
pkgname=skycoin-bin
_projectname=${_pkgname}
_githuborg=${_projectname}
pkgdesc="Skycoin Cryptocurrency Wallet; Binary Release - DEBIAN PACKAGE"
pkgver='0.27.1'
_pkgver=$pkgver
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=2
_pkgrel=$pkgrel
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
#Uncoment to select architecture - cross compile not working currently
#_pkgarch=amd64
#_pkgarch=arm64
#_pkgarch=armhf
#leave arch package as any
arch=('any')
url="https://${_pkggopath}"
_url="https://downloads.${_projectname}.com/wallet"
license=()
makedepends=('dpkg')
provides=( 'skycoin' )
conflicts=( 'skycoin' )
#bsdtar -czvf skycoin-scripts.tar.gz skycoin-scripts
source=("${_pkgname}-scripts.tar.gz")
# "PKGBUILD.sig")
sha256sums=('0738ce23beafc315cad3971afb9b210b0749df05e064db169aea618b5bbd5555')
# 'SKIP')
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-x64.tar.gz
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-arm.tar.gz
_release_url=("${_url}/${_pkgname}-${pkgver}-gui-standalone-linux")
source_x86_64=("${_release_url}-x64.tar.gz")
# "${_release_url}-x64.tar.gz.asc")
source_aarch64=("${_release_url}-arm.tar.gz")
# "${_release_url}-arm.tar.gz.asc")
source_armv8=( ${source_aarch64[@]} )
source_armv7=( ${source_aarch64[@]} )
source_armv7h=( ${source_aarch64[@]} )
source_armv7l=( ${source_aarch64[@]} )
source_armv6h=( ${source_aarch64[@]} )
source_armhf=( ${source_aarch64[@]} )
source_armel=( ${source_aarch64[@]} )
source_arm=( ${source_aarch64[@]} )
sha256sums_x86_64=('ba4c2354b091b3db0ac7418caab1d52988b6fd1d18a9f0d5e0ebcb3f4ef15f94')
# 'ba4c2354b091b3db0ac7418caab1d52988b6fd1d18a9f0d5e0ebcb3f4ef15f94')
sha256sums_aarch64=('e4bbbde43a4971d21aefec55d4fbe3173694567bc372718ce4dd7352ca0bc169')
# 'e4bbbde43a4971d21aefec55d4fbe3173694567bc372718ce4dd7352ca0bc169'
sha256sums_armv8=( ${sha256sums_aarch64[@]} )
sha256sums_armv7=( ${sha256sums_aarch64[@]} )
sha256sums_armv7h=( ${sha256sums_aarch64[@]} )
sha256sums_armv7l=( ${sha256sums_aarch64[@]} )
sha256sums_armv6h=( ${sha256sums_aarch64[@]} )
sha256sums_armhf=( ${sha256sums_aarch64[@]} )
sha256sums_armel=( ${sha256sums_aarch64[@]} )
sha256sums_arm=( ${sha256sums_aarch64[@]} )

build() {
  for i in ${_pkgarches[@]}; do
    msg2 "_pkgarch=$i"
    local _pkgarch=$i
    _msg2 'creating the DEBIAN/control files'
    #create control file for the debian package
    echo "Package: skycoin-bin" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    #echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: the-skycoin-project" >> ${srcdir}/${_pkgarch}.control
    echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control

  done
}

package() {
#loop to make packages for the different architectures
  for i in ${_pkgarches[@]}; do
  msg2 "_pkgarch=${i}"
  local _pkgarch=${i}

_msg2 'creating dirs'
####################### set up to create a .deb package #######################
#_debpkgdir is the full name of the package with version and architecture
_debpkgdir="${_pkgname}-bin-${pkgver}-${_pkgrel}-${_pkgarch}"
#_pkgdir substituites for pkgdir in terms of where the files are installed, so the package operation is the same as for archlinux
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skycoin"
_skybin="${_skydir}/bin"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin ${_skybin}

cd $_pkgdir

_msg2 'installing binaries'
#install binary
_msg2 'installing gui sources'
#install the web dir (UI)
if [[ $CARCH == 'x86_64' ]] ; then
  install -Dm755 ${srcdir}/${_pkgname}-${pkgver}-gui-standalone-linux-x64/${_pkgname} ${_pkgdir}/${_skybin}/${_pkgname}
  cp -r ${srcdir}/${_pkgname}-${pkgver}-gui-standalone-linux-x64/src ${_pkgdir}/opt/${_pkgname}/
else
install -Dm755 ${srcdir}/${_pkgname}-${pkgver}-gui-standalone-linux-arm/${_pkgname} ${_pkgdir}/${_skybin}/${_pkgname}
cp -r ${srcdir}/${_pkgname}-${pkgver}-gui-standalone-linux-arm/src ${_pkgdir}/opt/${_pkgname}/
fi
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname} ${_pkgdir}/usr/bin/${_pkgname}
chmod 755 ${_pkgdir}/usr/bin/${_pkgname}


_msg2 'installing scripts'
#install the scripts
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-wallet ${_pkgdir}/usr/bin/${_pkgname}-wallet
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-wallet-nohup ${_pkgdir}/usr/bin/${_pkgname}-wallet-nohup

_msg2 'installing DEBIAN/control file, postinst & postrm scripts'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/postinst.sh ${_pkgdir}/DEBIAN/postinst
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
########################create the debian package!#########################
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit

}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
