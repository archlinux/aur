# Maintainer: aliu <aaronliu0130 gmail.com>
# Contributor: wyzdwdz <wyzdwdz@gmail.com>
pkgname="sideloader-bin"
pkgver="1.0_pre4"
pkgrel="1"
pkgdesc="Open-source cross-platform iOS app sideloader"
arch=("x86_64" "aarch64")
url="https://github.com/Dadoum/Sideloader"
license=("SSPL-1.0")
depends=("libimobiledevice" "libplist" "openssl" "gtk4" "libadwaita" "glib2" "util-linux-libs")
makedepends=("unzip")
source_x86_64=("sideloader-gtk-x86_64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-x86_64-linux-gnu.zip")
source_aarch64=("sideloader-gtk-aarch64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-aarch64-linux-gnu.zip")
sha256sums_x86_64=('2f22002a370e44fe2d61d520bd905175dead48e70b2dc567390e05d3357a0ae6')
sha256sums_aarch64=('7365d469af544ce21eb8553f7e37c6e0b82aaaf3884477651fa3748f2ff7392f')

package() {
  install -Dm755 sideloader-gtk-$CARCH-linux-gnu "$pkgdir/usr/bin/sideloader"
}
