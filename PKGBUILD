# Heliocron

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=heliocron-bin
_pkgname=${pkgname%-*}
pkgver=0.4.0
pkgrel=2
pkgdesc='Execute tasks relative to sunset, sunrise and other solar events.'
arch=('x86_64')
url='https://github.com/mfreeborn/heliocron'
license=('Apache' 'MIT')
provides=('heliocron')
conflicts=('heliocron-git')
source=(
	"https://github.com/mfreeborn/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=(
	'83cd3d97d0b32a624069f16a82991ad7ee01826ee9532d124cce6eff4aea6b0d'
)

package() {
	cd "$srcdir/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

