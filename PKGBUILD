pkgname=kumono-bin
pkgver=0.48.3
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono-$pkgver::$url/releases/download/$pkgver/kumono")
sha256sums=('631db334fa47e68a1b8ffa2f3f14e613abdd67efdd5cb3397d49f42c07eb8abe')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver" "$pkgdir/usr/bin/kumono"
}
