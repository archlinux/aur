# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('5c04cce3d8f08e0c71c85c072a1cbe7dd8c11d0621a64292c112631745734c2f')
sha256sums_aarch64=('a147eb8ebaea50440ababf0b8c1738f658ded721f7a8bd73d19260c8a8318849')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
