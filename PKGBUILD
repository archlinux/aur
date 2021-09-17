# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
_pkgname="${pkgname%-bin}"
pkgver=1.6.25
pkgrel=1
pkgdesc='Solana CLI tools'
arch=('x86_64')
url='https://solana.com'
license=('Apache')
depends=(
	'openssl'
	'systemd-libs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.bz2::https://github.com/$_pkgname-labs/$_pkgname/releases/download/v$pkgver/$_pkgname-release-x86_64-unknown-linux-gnu.tar.bz2")
b2sums=('d549c8955a739bf7514ca277fb246d0ca35656988065ffb73db1f61305d99033c9406b67d1c0056044a85c06d4f6953cad2fa424a93a511722aaa30dc0f60f56')
b2sums=('d549c8955a739bf7514ca277fb246d0ca35656988065ffb73db1f61305d99033c9406b67d1c0056044a85c06d4f6953cad2fa424a93a511722aaa30dc0f60f56')

package() {
	install -Dm 755 "${_pkgname}-release/bin/"{solana*,spl-token} -t "$pkgdir/usr/bin"
}
