pkgname=rib
pkgver=1.1
pkgrel=1
pkgdesc='a simple utility for running applications independently of the console.'
arch=('any')
license=('MIT')
depends=('bash' 'sudo')
source=('https://gitlab.com/castluno/rib/-/raw/07b31a0d14a359eaed4f99155cc3cd116719ef02/main.sh'
        'https://gitlab.com/castluno/rib/-/raw/07b31a0d14a359eaed4f99155cc3cd116719ef02/surib.sh')
sha256sums=('ab57bd7b54f5e997763dc9da6dd43134eeaa45ff430f7725b9765f7489f898ed'
            '1e399ecb55360fbbb3d7bbda2cb5e6e849e5d0fb6f09cfa4ca02a1f369863886')

package() {
    install -Dm755 "$srcdir/main.sh"  "$pkgdir/usr/bin/rib"
    install -Dm755 "$srcdir/surib.sh" "$pkgdir/usr/bin/surib"
}
