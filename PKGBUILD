# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.6.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('8eafaa5da0e20cb3cb0572cdf2e746179a0a7c19af76d19216232e534d904a135e2eccfbd77264ed9fc7cd2b8887a0183f7d7049761b1cc2990771fc4c63146c')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
