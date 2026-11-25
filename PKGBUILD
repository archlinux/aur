# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.57.0
pkgrel=1
pkgdesc="Protect your secrets with GitGuardian."
arch=(any)
url="https://github.com/GitGuardian/ggshield"
license=(MIT)
depends=('python' 'git')
makedepends=()
options=('!debug')
source=("https://github.com/GitGuardian/${pkgname}/releases/download/v${pkgver}/ggshield_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('6e42e4c5524b4f98e144ddab7c2ca442674bf95a1350658536ec6fefb2dbe7e1')


package() {
  # Install package
  bsdtar -O -xf ggshield_${pkgver}-${pkgrel}_amd64.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
