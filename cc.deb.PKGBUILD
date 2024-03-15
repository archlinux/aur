# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
source PKGBUILD
_pkgver=${pkgver}
_pkgrel=${pkgrel}
pkgdesc="Skywire: Decentralize the web. Skycoin.com. Debian package"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('amd64' 'arm64' 'armhf' 'armel' 'riscv64')
arch=('any')
license=('license-free')
makedepends=('dpkg')
_debdeps=""
source=("${_source[@]}"
"${source_x86_64[@]}"
"${source_aarch64[@]}"
"${source_armv7[@]}"
"${source_arm[@]}"
"${source_riscv64[@]}"
)
noextract=(
"${source_x86_64[@]}"
"${source_aarch64[@]}"
"${source_armv7[@]}"
"${source_arm[@]}"
"${source_riscv64[@]}"
)
sha256sums=('9257dc9cf98b382049b500f646c0005950077cedb83abbb62984983e4dda0874'
            '40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            'bf2876b7c41b204452cca141600af39e5a4e17486e9f09e20069d8f4316e6063'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            '104f74b445830871fe12f4a179a601d8ea98e731b818a61a2de5df0e51498422'
            '947c1751c4bdd79b74f3a691b9f5c1de55cc05802c9d5e4859385cb241a5a45b'
            'f24132456c5bcf0b7acb4e70b477740b19cecb32dea5022967ae13921508badb'
            'a2c457c8373c2c85df4110ec15080f802ba621ad53e69ad01b34a196bf08864b'
            '45ed6049df988f042c9a0352d33fef88fc9018398d09252aa4698948ce783c11'
            'b3a9a422e146fa0583482dc83a0f4e9ae25995ea1cc4fdfebc14c80dc1c596a5'
            '763c5a4251e819b944cfefeafa56e3d2bdfdd2e7e1198fdf1d369f3143990b5a'
            'd1bbd2b6d141cee8499fe2ae0c8429325d2d80ea895cce3db2db11f0629cc740'
            'e3a1a975138e6778a1e3ea47e98da94088c7c2d945295cd4ccbd0c992d6346c6'
            '480cb21293902b18584d6b0da2254f12b3f08176c52ce8c106c538df59e2d723'
            '460e23ee28722335b7925ea6f960cac5623081d149cf4b964ab300cf1f8b01d9'
            'de66e64e01b0058dc31bb78865b167816bc949598a774bd58b3b772c3ac6428f'
            '2796332b21f6503ef4b28b3475aedcd8f2ccde806ce47f7b0483a097b134052c'
            '5b89faf8c27dc7bf091fcf98bde504182060a7a1ddbd04f04030097bd175e53a')

build() {
  _msg2 'creating the DEBIAN/control files'
  for _i in ${_pkgarches[@]}; do
    _msg2 "_pkgarch=${_i}"
    local _pkgarch=${_i}
    #create control file for the debian package
    echo "Package: ${pkgname}" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Provides: ${_pkgname}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: ${_githuborg}" >> ${srcdir}/${_pkgarch}.control
    echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
  done
  echo -e '#!/bin/bash\n[[ -f /opt/skywire/scripts/skywire-autoconfig ]]  && /opt/skywire/scripts/skywire-autoconfig || echo "error: /opt/skywire/skywire-autoconfig missing"' | tee "${srcdir}/postinst.sh"
  echo -e '#!/bin/bash\n[[ -d /opt/skywire ]]  && rm /opt/skywire || echo "error: directory /opt/skywire not present so not removed"' | tee "${srcdir}/prerm.sh"
  _build
}

package() {

for _i in "${_pkgarches[@]}"; do
_msg2 "_pkgarch=${_i}"
local _pkgarch="${_i}"
local _pkgarch1="${_pkgarch}"
if [[ ${_pkgarch} == "armel" || ${_pkgarch} == "armhf" ]] ; then
  local _pkgarch1=arm
fi

local _binaryarchive="${_pkgname}-deployment-${_tag_ver}-linux-${_pkgarch1}.tar.gz"
[[ -f "${srcdir}/${_pkgname}" ]] && rm -rf "${srcdir}/${_pkgname}" || true
#[[ -d "${srcdir}/apps" ]] && rm -rf "${srcdir}/apps" || true
[[ -d "${pkgdir}/test" ]] && rm -rf "${pkgdir}/test" || true
mkdir -p "${pkgdir}/test" && cd "${pkgdir}/test"
tar -xf "${srcdir}/${_binaryarchive}"

GOBIN="${pkgdir}/test"
_GOAPPS="${GOBIN}/apps"
cp "${srcdir}/skywire-cli" "${pkgdir}/test/"
cp "${srcdir}/skywire-visor" "${pkgdir}/test/"
cp -r "${srcdir}/apps" "${_GOAPPS}"
#set up to create a .deb package
_debpkgdir="${pkgname}-${pkgver}-${pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
[[ -d "${_pkgdir}" ]] && rm -rf "${_pkgdir}"

#declare the _pkgdir and systemd directory
_systemddir="etc/systemd/system"

_package

_msg2 'installing control file and install scripts'
install -Dm755 "${srcdir}/${_pkgarch}.control" "${_pkgdir}/DEBIAN/control"
install -Dm755 "${srcdir}/postinst.sh" "${_pkgdir}/DEBIAN/postinst"
install -Dm755 "${srcdir}/prerm.sh" "${_pkgdir}/DEBIAN/prerm"
_msg2 'creating the debian package'
#create the debian package!
cd "${pkgdir}"
dpkg-deb --build -z9 "${_debpkgdir}"
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
}
