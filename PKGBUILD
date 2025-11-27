# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=vgmstream
pkgname=$_pkgname-cli-bin
pkgver=r2055
pkgrel=2
pkgdesc='A command line tool for decoding streamed (prerecorded) video game audio.'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-cli.zip"::"$url/releases/download/$pkgver/$_pkgname-linux-cli.zip"
        "COPYING-$pkgver"::"https://raw.githubusercontent.com/$_pkgname/$_pkgname/refs/tags/$pkgver/COPYING")
b2sums=('33083fa874ac0ba1adf361e58d37bc314e554261354d53d3b3815795c43a6c3e22903b3b6e159b34f1bc209124359807d05a80b6f856621632baeb84b30c526a'
        '5479d2622114a8d645ab500181c267e8af19f1b877c7b9e289619166d0d95cbfcb2a731fded3862dd684f21927341fad95fa5ba482c05446fc4b76ef9cb7201d')

package() {
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
}
