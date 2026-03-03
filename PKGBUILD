# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=vgmstream
pkgname=$_pkgname-cli-bin
pkgver=r2083
pkgrel=1
pkgdesc='A command line tool for decoding streamed (prerecorded) video game audio.'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('ISC')
provides=("$_pkgname-cli")
conflicts=("$_pkgname-cli")
source=("$_pkgname-$pkgver-cli.zip"::"$url/releases/download/$pkgver/$_pkgname-linux-cli.zip"
        "COPYING-$pkgver"::"https://raw.githubusercontent.com/$_pkgname/$_pkgname/refs/tags/$pkgver/COPYING")
b2sums=('071dce6235696953d68c101575b38e193ed5c55b047eb29c045424d0e7929e5544417395468d50cabe5c79993bc57334da9e186b8a4988738694c2b12717ac9a'
        '5479d2622114a8d645ab500181c267e8af19f1b877c7b9e289619166d0d95cbfcb2a731fded3862dd684f21927341fad95fa5ba482c05446fc4b76ef9cb7201d')

package() {
	install -Dm644 COPYING-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
}
