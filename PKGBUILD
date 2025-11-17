# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=vgmstream
pkgname=$_pkgname-cli-bin
pkgver=r2055
pkgrel=1
pkgdesc='A command line tool for decoding streamed (prerecorded) video game audio.'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-cli.zip"::"$url/releases/download/$pkgver/$_pkgname-linux-cli.zip"
        "https://raw.githubusercontent.com/$_pkgname/$_pkgname/refs/tags/$pkgver/COPYING")
b2sums=('33083fa874ac0ba1adf361e58d37bc314e554261354d53d3b3815795c43a6c3e22903b3b6e159b34f1bc209124359807d05a80b6f856621632baeb84b30c526a'
        'b3e34d115b41395a366825364216e3523138beed60e06013470742c469070fc0917773d30b0073f85d5fed1a367c1b39741ae4d6c07f283aef6afd77f4d53f52')

package() {
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
}
