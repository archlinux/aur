# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
source PKGBUILD
_pkgver=${pkgver}
_pkgrel=${pkgrel}
pkgdesc="Skywire: Decentralize the web. Skycoin.com. Debian package"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('amd64' 'arm64' 'armhf' 'armel')
arch=('any')
license=('license-free')
makedepends=('dpkg')
_debdeps=""
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source=("${_source[@]}"
"${_release_url}-amd64.tar.gz"
"${_release_url}-arm64.tar.gz"
"${_release_url}-armhf.tar.gz"
"${_release_url}-arm.tar.gz"
"postinst.sh"
"prerm.sh"
)
noextract=(
"${_binarchive}-amd64.tar.gz"
"${_binarchive}-arm64.tar.gz"
"${_binarchive}armhf.tar.gz"
"${_release_url}-arm.tar.gz"
)
sha256sums=('28cfaf8fb5c17e0d2952d8834d24952a1e402fccb3a575371cea37366d8d7b00'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '9c94295df9dadbdbd5b891c6669c112e69ede97922791579ffdf415130a084da'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            '41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14'
            '1037ecc2df9e7a0f825db88f9fe5aee4450576511dc321f1b66b0cae4f5d54b6'
            '5c2dbe82659dd36caa70073559801d40e81b00d3b786c130cc5390aacf6449f4'
            '77060322651466a817150843312b0490d20314208992ab4eca0b181993c3093a'
            '369a6ac68a9f81cbc049d0f3a239231b4eb880cbd33914eb9f7bb7d3487f9f8b'
            '7b17a55e64d1371fecd24edc3da7c6a762cf2b3d058f6fc4a5dc7c5f9b4cff09'
            '233ccf0e87b37e782828f53960e05e478cf381f61bbfdb16a0cc0254ee8be7c2')

build() {
  _msg2 'creating the DEBIAN/control files'
  for i in ${_pkgarches[@]}; do
    _msg2 "_pkgarch=$i"
    local _pkgarch=$i
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
}

package() {
GOBIN="${srcdir}/"
_GOAPPS="${GOBIN}/apps"
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_package
}


package() {

for _i in "${_pkgarches[@]}"; do
_msg2 "_pkgarch=${_i}"
local _pkgarch="${_i}"
local _pkgarch1="${_pkgarch}"
if [[ ${_pkgarch} == "armel" || ${_pkgarch} == "armhf" ]] ; then
  local _pkgarch1=arm
fi

local _binaryarchive="${_pkgname}-${_tag_ver}-linux-${_pkgarch1}.tar.gz"
[[ -f "${srcdir}/${_pkgname}-visor" ]] && rm -rf "${srcdir}/${_pkgname}-visor"
[[ -f "${srcdir}/${_pkgname}-cli" ]] && rm -rf "${srcdir}/${_pkgname}-cli"
[[ -d "${srcdir}/apps" ]] && rm -rf "${srcdir}/apps"
[[ -d ${pkgdir}/test ]] && rm -rf ${pkgdir}/test
mkdir -p "${pkgdir}/test" && cd "${pkgdir}/test"
tar -xf "${srcdir}/${_binaryarchive}"

GOBIN="${pkgdir}/test"
_GOAPPS="${GOBIN}/apps"
#set up to create a .deb package
_debpkgdir="${pkgname}-${pkgver}-${pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
[[ -d "${_pkgdir}" ]] && rm -rf "${_pkgdir}"

#declare the _pkgdir and systemd directory
_systemddir="etc/systemd/system"

_package

_msg2 'installing control file and install scripts'
install -Dm755 "${srcdir}/${_pkgarch}.control" "${_pkgdir}/DEBIAN/control"
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 "${srcdir}/postinst.sh" "${_pkgdir}/DEBIAN/postinst"
install -Dm755 "${srcdir}/prerm.sh" "${_pkgdir}/DEBIAN/prerm"
#install -Dm755 "${srcdir}/${_scripts}/postrm.sh" "${_pkgdir}/DEBIAN/postrm"

_msg2 'creating the debian package'
#create the debian package!
cd "${pkgdir}"
dpkg-deb --build -z9 "${_debpkgdir}"
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
}
