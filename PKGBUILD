# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=vgmstream
pkgname=$_pkgname-cli-bin
pkgver=r2117
pkgrel=1
pkgdesc='A command line tool for decoding streamed (prerecorded) video game audio.'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('ISC')
provides=("$_pkgname-cli")
conflicts=("$_pkgname-cli")
source=("$_pkgname-$pkgver-cli.zip"::"$url/releases/download/$pkgver/$_pkgname-linux.zip"
        "COPYING-$pkgver"::"https://raw.githubusercontent.com/$_pkgname/$_pkgname/refs/tags/$pkgver/COPYING")
b2sums=('b602e47ea19c39a24b4a4ef819c7aa1e6cd5741e0f547bfa8aba2b0d042df62aee2a01213c76b4154888d3089b12249f489a33e918bebffc48904225e2a3e3d6'
        'f739f4ad63c767e3e9bac73efd8fda360033d9fc1b3eb0cef4084489577ce7798512578d8076681b9df09c49be4c31893fa0a5a4572644dfc1a46207349e07a5')

package() {
	install -Dm644 COPYING-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
}
