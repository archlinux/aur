# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('efbf61bc15dff4c2c2e244a9a63b81582656d7add6daa3116a5062acbb1cc482')
sha256sums_aarch64=('f4f2ab793d923ce3d8dc8fa8768019e7bd67e025c6af102ce219ffefb7bfd05a')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
