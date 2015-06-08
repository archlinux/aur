# Maintainer: AcidHub <acidhub@craft.net.br>

pkgname=bash-pipes
pkgver=1.1.0
pkgrel=1
pkgdesc='Pipes screensaver for bash'
arch=('any')
url='https://github.com/BlackXT/pipes.sh'
license=('GPL')
depends=('bash')
source=("https://github.com/BlackXT/pipes.sh/archive/v$pkgver.tar.gz")
sha512sums=('c6fb30c32405ef04ab09c9e77554c8bc2a1d799ad78461305f1f97aace8866f15034608afd59dece5637d593ae60a6e9d5f41ace54172fbe82488b629edf1a78')

package() {
	install -Dm755 "$srcdir"/pipes.sh-$pkgver/pipes.sh "$pkgdir"/usr/bin/pipes
	install -Dm755 "$srcdir"/pipes.sh-$pkgver/pipes_orig.sh "$pkgdir"/usr/bin/pipes_orig
}
