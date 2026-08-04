# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.53.0
pkgrel=1
pkgdesc="Protect your secrets with GitGuardian."
arch=(any)
url="https://github.com/GitGuardian/ggshield"
license=(MIT)
depends=('python' 'git')
makedepends=()
options=('!debug')
source=("https://github.com/GitGuardian/${pkgname}/releases/download/v${pkgver}/ggshield_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('a485e45606c91856144291072877506478939f730d10c81e26c95008f4684e17')


package() {
  # Install package
  bsdtar -O -xf ggshield_${pkgver}-${pkgrel}_amd64.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
