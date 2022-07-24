# Maintainer: fossdd <fossdd@pwned.life>

pkgname=forkbomb
pkgver=2
pkgrel=0
pkgdesc="Powers a fork bomb"
depends=('bash')
arch=('any')
url="https://en.wikipedia.org/wiki/Fork_bomb"
source=("forkbomb.sh")
license=('Unlicense')
sha512sums=('581939093aa3c8937b0988edab2875a1e775e201efa06443a07a6f745d884f8db671a33ce44f6827a0a3607e647959e648b069448b0b5477c1acc094691210bc')

package() {
    install -Dm755 "forkbomb.sh" "$pkgdir/usr/bin/forkbomb"
}
