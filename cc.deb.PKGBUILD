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
sha256sums=('08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '6d40c32452151145fef51d87cd09423cceb4d7205869e8f80fc074cd5e68f98d'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            'b3aee9b0f3aab79896ba0dbba54e94b3db5e9e51e189a82ae0e29628b4d27103'
            '1cb4a0cce715036ae9e50bb1d4cdde02d8cf783a8c3c5de749c9feb121bbeffc'
            '42284413d5b0cff76ca6cae3d45a3e6e5a391ae5db56baed0f683f8b1213251d'
            '3cd3d7d07eab5fa2aaf4327b9c7779c16125b2923aa70d7009631233ca7120e1'
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
