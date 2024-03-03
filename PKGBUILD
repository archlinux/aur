# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
license=('MIT')
pkgver=0.0.6
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('4e4571145ae61a619cd8645ba5ca8786dd5d3411b9416d27ba43583cdd9d580f')
sha256sums_aarch64=('d8cb4b73ca932587a9c3c43dfb59220b33a8336c9528ba447feba045b75e5667')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
