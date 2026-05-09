# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=anirss
pkgver=0.1.0
pkgrel=1
pkgdesc="Search nyaa.si and hand the result to qBittorrent"
arch=('any')
url="https://github.com/marcusbandit/anirss"
license=('GPL-3.0-or-later')
depends=('python' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/anirss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('341d7fd355f090dd4c23830ae000f0c965048934b8446872febcdd1c32d13776')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 anirss      "$pkgdir/usr/bin/anirss"
    install -Dm644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
