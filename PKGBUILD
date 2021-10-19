# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-godns
pkgver=1.0.0
pkgrel=5
pkgdesc="systemd for godns"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('godns')
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=("godns@.service")
sha512sums=('e9a1b8601db10bf65c6dc2ff7c06caa5f5bda80119d18165e621ae49c95d3a747cb7cc114838e287c0e1967f7e5303e819c82ee714ab9e021a891a8eba15f3e9')

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
 # make -C build

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm644 godns@.service  "$pkgdir/usr/lib/systemd/system/godns@.service"
}

groups=('lcj')

