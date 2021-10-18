# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-kexec
pkgver=1.0.0
pkgrel=7
pkgdesc="systemd for kexec"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('kexec-tools')
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=("kexec-load@.service")
sha512sums=('cde894488d4587b7b0272956dedfdd7684c4fe423726e008f6217eb59a5d5dfbb5289dabde5a354ab7b612c4b5b25ce2c397e632a6c4acc7f77c6d2b8fe7bdf4')

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
install -Dm644 kexec-load@.service  "/etc/systemd/system/kexec-load@.service"
}

groups=(lcj211)

