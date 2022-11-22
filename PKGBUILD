# Maintainer: Konstantin Shurukhin <kshurukhin (at) gmail (dot) com>
pkgname=nap-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Code snippet manager for your terminal'
url='https://github.com/maaslalani/nap'
source_x86_64=("https://github.com/maaslalani/nap/releases/download/v$pkgver/nap_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/maaslalani/nap/releases/download/v$pkgver/nap_${pkgver}_linux_386.tar.gz")
source_aarch64=("https://github.com/maaslalani/nap/releases/download/v$pkgver/nap_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')
depends=('pacman')
conflicts=('nap')
provides=('nap')
sha256sums_x86_64=('6d9ded2bfadee19a41a085c8f6cb5890efe9feaa52d0c58cba5e85635360f781')
sha256sums_aarch64=('da7e73bcf6c898923c98d3a8b400ef1fbb17ebfe856dbab2f331eb2bfbed7ba7')
sha256sums_i686=('179c0d8665a6e7528949d927b6c48af8a654a55ac852e26c450f23ac0f2c9edd')

package() {
  cd "$srcdir/"

  install -Dm755 nap "${pkgdir}/usr/bin/nap"
}
