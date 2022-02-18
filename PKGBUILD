# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=lovesay
pkgver=2022.02.18
pkgrel=1
pkgdesc="Simple tool that spits out a random love message with hearts."
arch=('any')
groups=('therepoclub')
url="https://github.com/the-repo-club/$pkgname"
license=('GPL3')
depends=(bash)
makedepends=('git')
source=("lovesay")
sha256sums=('SKIP')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
