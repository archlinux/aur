# Maintainer: li <lcj211@aihlp.com>

pkgname=gfwlist-route
pkgver=1.0.0
pkgrel=1
pkgdesc="gwflist ip for china . and add it to route "
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
#depends=('systemd-kexec' 'systemd-godns' 'git-tools')
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
"gfwlist-route.service"
"gfwlist-route.timer"
)
sha512sums=(
'5238d70e79806c72d224bdf786fdc1b369886202bac1f263d59a0df87bb7de52d900ecc42799a9a675c99bbc087d8dbbc4dc06ef6a5d5946280e5348b4ee668c'
'd9c16c83f1f2aca760f70c5652f2c18442d32ade766ed67033e861b80d76df5f3147b55b1dbd1024d00b0bfdd8b37e0a6e0dab6eb8ab33b58c074b645a562a2e'
)

#Package files should follow these general directory guidelines:
#/etc	System-essential configuration files
#/usr/bin	Binaries
#/usr/lib	Libraries
#/usr/include	Header files
#/usr/lib/{pkg}	Modules, plugins, etc.
#/usr/share/doc/{pkg}	Application documentation
#/usr/share/info	GNU Info system files
#/usr/share/man	Manpages
#/usr/share/{pkg}	Application data
#/var/lib/{pkg}	Persistent application storage
#/etc/{pkg}	Configuration files for {pkg}
#/opt/{pkg}	Large self-contained packages


#build() {
 # rm -rf build
 # cmake -B build -S "$pkgname-v$pkgver" \
 # -DCMAKE_INSTALL_PREFIX=/usr \
 # -DBUILD_TESTING=OFF \
 # -Wno-dev
 # make -C build:

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm755 gfwlist-route.service  "$pkgdir/usr/lib/systemd/system/gfwlist-route.service"
install  -Dm755 gfwlist-route.timer  "$pkgdir/usr/lib/systemd/system/gfwlist-route.timer"
}

groups=('lcj')

