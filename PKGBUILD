# Maintainer: Nicolas Villafan <pegromdev@gmail.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=aptl
pkgver=1.1.7
pkgrel=1
pkgdesc="Creates installed lists of pkgs with Names & Descriptions for backup proposes."
arch=('x86_64')
url="https://github.com/pegromdev/$pkgname"
license=('MIT')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
