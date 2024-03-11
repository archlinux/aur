# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
license=('MIT')
pkgver=0.0.13
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('bc05803cf7464900a9bc8d8278b6ba96d2d7d24066abaece220a7643df68866b')
sha256sums_aarch64=('fa786fa8d62b68b22c310557ce10c2e8eb2e9b04f9976ed4669e1e5ddfcb17c2')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
