# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.9.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('6aff6154876f4356e0d9fb357559793205d10e672a986def071f9891c8b1f1c2d929f8a33c5ddd2807cf4a6dc62ea2960f01c8a4713a937104ed88e0a025d0bd')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
