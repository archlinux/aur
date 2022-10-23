# Maintainer: Paul Spruce <paul.spruce@gmail.com>

_pkgname=shosubgo
pkgname=shosubgo-bin
pkgver=2.0
pkgrel=3
pkgdesc="Small tool to Grab subdomains using Shodan api."
arch=(x86_64)
url="https://github.com/incogbyte/shosubgo"
license=(unknown)
provides=(shosubgo)
conflicts=(shosubgo)
source=("$pkgname-$pkgver::$url/releases/download/2.0/shosubgo_linux"
        "$pkgname-$pkgver-README.md::https://raw.githubusercontent.com/incogbyte/shosubgo/92c8070aade4735f855e09a173acf95f1789ca76/README.md")
b2sums=("e07d113bd613c970fe153550910dd48f7065bee455f123cd905816cec21dbf8358e619184d38a7303e43da04786ec9ea8b6ffba87bdc0e29bb1b3061d9b02936"
        "936884ad54793e18659fe8f62ab71128135098082ac1aa10ea3c30d9664f79d49b718820bbf4e33a7372054109a5a43e61214575f268d249cf26c32acb4c2ef1")

package() {
    install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/shosubgo_linux"
	install -Dm644 $pkgname-$pkgver-README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
