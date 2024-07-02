# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-godns
pkgver=1.0.1
pkgrel=27
pkgdesc="systemd for godns"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')

depends=('godns-bin')
conflicts=( 
godns
)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=("godns@.service")
sha512sums=('684ae45c61d2ad2591c39e0be13bde6e10a9d6563d567cb58568f105a8da6e05d5a817ac1b72367bad1e0d360d6f60bafb13053b6169d78932c297f71d7e7fa8')

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

groups=(lcj-all lcj-desk  lcj-route lcj-server)

