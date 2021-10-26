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
gfwlist-route  
gfwlist-route.service  
gfwlist-route.timer
)
#sha512sums=(
#80b16d2a95805c6f894c9775e6989568c2b2147d2b4403970358d37a2cf0a055b2b30323f7a01f9aa547eb5720393b9425914c34c57ea23a775c247184af0d3e


#)

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
install  -Dm755 gfwlist-route  "$pkgdir/usr/lib/$pkgname/gfwlist-route"
install  -Dm644 gfwlist-route.service  "$pkgdir/usr/lib/systemd/system/gfwlist-route.service"
install  -Dm644 gfwlist-route.timer  "$pkgdir/usr/lib/systemd/system/gfwlist-route.timer"
}

groups=('lcj')

