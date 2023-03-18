 # Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
 source PKGBUILD
 _pkgver=${pkgver}
 _pkgrel=${pkgrel}
pkgdesc="Skywire Mainnet Node implementation; develop branch - Debian testing package."
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64' 'armel')
arch=( 'any' )
license=('license-free')
#note some makedeps are failing to build for me currently. Debian cross-compilation needs static binaries to work.
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl')
_debdeps=""
source=("git+${url}.git#branch=develop"
"${_source[@]}"
)
sha256sums=('SKIP'
            'a55c345c144f18a1a58161630635aa08c7ff6cd4a73752368d0eaa43ecf7af92'
            '40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '88c55cc334eb8b0ba7557d3a4b3d1eaeec67cb29b4dfc396f796476bf82fead7'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            'b8d0b0afd03bf6c1cf9814874d7aa465f4d7e57075260f797993e46b33ab8480'
            '41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14'
            'dcb3b8bc1f6fa58dd64b95045b8b010489352c815f737bf2cbf8812973a8dc49')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

prepare() {
for _i in "${_pkgarches[@]}"; do
_msg2 "$_i"
done
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p "${srcdir}/go/src/github.com/${_githuborg}/"
for _i in "${_pkgarches[@]}"; do
mkdir -p "${srcdir}/go/bin.${_i}"
mkdir -p "${srcdir}/go/apps.${_i}"
done
ln -rTsf "${srcdir}/${_pkgname}" "${srcdir}/go/src/${_pkggopath}"
cd "${srcdir}/go/src/${_pkggopath}/"
}

build() {
export GOPATH="${srcdir}/go"
export GOOS=linux
export CGO_ENABLED=1  #default anyways

local _version="${pkgver}"
DMSG_BASE="github.com/skycoin/dmsg"
BUILDINFO_PATH="${DMSG_BASE}/buildinfo"
BUILDINFO_VERSION="${BUILDINFO_PATH}.version=${_version}"
BUILDINFO=${BUILDINFO_VERSION} ${BUILDINFO_DATE} ${BUILDINFO_COMMIT}
#use musl-gcc for static compilation
for _i in "${_pkgarches[@]}"; do
msg2 "_pkgarch=$_i"
local _pkgarch=$_i
export GOBIN="${GOPATH}/bin.${_pkgarch}"
export _GOAPPS="${GOPATH}/apps.${_pkgarch}"
export GOOS=linux
#static cross-compilation
[[ $_pkgarch == "amd64" ]] && export GOARCH=amd64 && export CC=musl-gcc
[[ $_pkgarch == "arm64" ]] && export GOARCH=arm64 && export CC=aarch64-linux-musl-gcc
[[ $_pkgarch == "armhf" ]] && export GOARCH=arm && export GOARM=6 && export CC=arm-linux-gnueabihf-musl-gcc
[[ $_pkgarch == "armel" ]] && export GOARCH=arm && export GOARM=5 && export CC=arm-linux-gnueabihf-musl-gcc
#_ldflags=('-linkmode external -extldflags "-static" -buildid=')

#create the skywire binaries
cd "${srcdir}/go/src/${_pkggopath}"
_msg2 "git branch:"
git branch
_msg2 "version:"
make version
_msg2 "commit:"
make commit

_cmddir="${srcdir}/go/src/${_pkggopath}/cmd"
_msg2 "building skychat binary"
cd "${_cmddir}/apps/skychat"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skysocks binary"
cd "${_cmddir}/apps/skysocks"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skysocks-client binary"
cd "${_cmddir}/apps/skysocks-client"
go build -trimpath --ldflags="" --ldflags " -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building vpn-client binary"
cd "${_cmddir}/apps/vpn-client"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building vpn-server binary"
cd "${_cmddir}/apps/vpn-server"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skywire-cli binary"
cd "${_cmddir}/skywire-cli"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building skywire-visor binary"
cd "${_cmddir}/skywire-visor"
go build -trimpath --ldflags="" --ldflags "-s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building setup-node binary"
cd "${_cmddir}/setup-node"
go build -trimpath --ldflags="" --ldflags " -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .

#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
echo -e "$_pkgarch"
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)

_msg2 'creating the DEBIAN/control files'
#create control file for the debian package
#this is not actually a binary release but is used for pre-release testing, so must have the same name
echo "Package: skywire-bin" > ${srcdir}/${_pkgarch}.control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
echo "Section: web" >> ${srcdir}/${_pkgarch}.control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
echo "Maintainer: github.com/the-skycoin-project" >> ${srcdir}/${_pkgarch}.control
echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
 done
}

package() {
for _i in "${_pkgarches[@]}"; do
msg2 "_pkgarch=${_i}"
local _pkgarch=${_i}
GOPATH="${srcdir}/go"
GOBIN="${GOPATH}/bin.${_pkgarch}"
_GOAPPS="${GOPATH}/apps.${_pkgarch}"
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-bin-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
[[ -d "${_pkgdir}" ]] && rm -rf "${_pkgdir}"
mkdir -p "${_pkgdir}/usr/bin"
mkdir -p "${_pkgdir}/${_skydir}/bin"
mkdir -p "${_pkgdir}/${_skydir}/apps"
mkdir -p "${_pkgdir}/${_skydir}/local"
mkdir -p "${_pkgdir}/${_skydir}/scripts"
mkdir -p "${_pkgdir}/${_systemddir}"

cd "$_pkgdir"
_msg2 'installing binaries'
 install -Dm755 "${GOBIN}/"* "${_pkgdir}/${_skybin}/"
for _j in "${_pkgdir}/${_skybin}/"* ; do
	ln -rTsf "${_j}" "${_pkgdir}/usr/bin/${_j##*/}"
done

_msg2 'installing app binaries'
_apps="${pkgdir}/test/apps"
install -Dm755 "${_GOAPPS}/"* "${_pkgdir}/${_skyapps}/"
for _j in "${_pkgdir}/${_skyapps}/"* ; do
	ln -rTsf "${_j}" "${_pkgdir}/usr/bin/${_j##*/}"
done

_msg2 'Installing scripts'
install -Dm755 "${srcdir}/skywire-autoconfig" "${_pkgdir}/${_skyscripts}/"
ln -rTsf "${_pkgdir}/${_skyscripts}/skywire-autoconfig" "${_pkgdir}/usr/bin/skywire-autoconfig"

_msg2 'Correcting symlink names'
ln -rTsf "${_pkgdir}/${_skybin}/${_pkgname}-visor" "${_pkgdir}/usr/bin/${_pkgname}"

#make sure everything is executable
chmod +x "${_pkgdir}/usr/bin/"*

_msg2 'installing dmsghttp-config.json'
install -Dm644 "${srcdir}/${_pkgname}/dmsghttp-config.json" "${_pkgdir}/${_skydir}/dmsghttp-config.json"

#install systemd services
_msg2 'Installing systemd services'
install -Dm644 "${srcdir}/"*.service "${_pkgdir}/${_systemddir}/"

_msg2 'installing desktop files and icons'
mkdir -p "${_pkgdir}/usr/share/applications/" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
install -Dm644 "${srcdir}/"*.desktop "${_pkgdir}/usr/share/applications/"
install -Dm644 "${srcdir}/"*.png "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"

_msg2 'installing control file and install scripts'
install -Dm755 "${srcdir}/${_pkgarch}.control" "${_pkgdir}/DEBIAN/control"
#install -Dm755 "${srcdir}/${_scripts}/preinst.sh" "${_pkgdir}/DEBIAN/preinst"
install -Dm755 "${srcdir}/postinst.sh" "${_pkgdir}/DEBIAN/postinst"
install -Dm755 "${srcdir}/prerm.sh" "${_pkgdir}/DEBIAN/prerm"
#install -Dm755 "${srcdir}/${_scripts}/postrm.sh" "${_pkgdir}/DEBIAN/postrm"

_msg2 'creating the debian package'
#create the debian package
cd "$pkgdir"
dpkg-deb --build -z9 "${_debpkgdir}"
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
}
