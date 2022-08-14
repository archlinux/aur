# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.8.1
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('7ab16c7b3fba63ad3aea826fa307a88f86c2cccd2d16b33787909abd75340015844b568e8e51b39b2d8d87547b73a5bea2edb1ebf25dc90e4f947cf5630f54cb')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
