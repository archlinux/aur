# Maintainer: Paul Spruce <paul.spruce@gmail.com>

_pkgname=unfurl
pkgname=unfurl-bin
pkgver=0.4.3
pkgrel=2
pkgdesc="Pull out bits of URLs provided on stdin"
arch=(x86_64)
url="https://github.com/tomnomnom/unfurl"
license=(MIT)
provides=(unfurl)
conflicts=(unfurl)
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-$pkgver.tgz")
source=("$pkgname-$pkgver-README.mkd::https://raw.githubusercontent.com/tomnomnom/unfurl/eb38934068048a8d4c691de203d62d9744c2a8df/README.mkd"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/tomnomnom/unfurl/19d91dbfe375b2623cc52f629b125d2630a30789/LICENSE")
b2sums_x86_64=('31c816700f2e511d40760da2c1fd48942be5ebcdfdd5d041b77f039dd7f68ee43cad1c84b7a70da552a200e0de92a72acf5d29f24704a2a8af0f5919e9c17dda')
b2sums=('e036aa36663fef86b357f55ecbbf080c25af30a4feabb3e796088ddc77a2ea29adfc7677ce031e554309e4311b9619f92aaeae1490a7fd0d1d244b35560a4fb4'
        'c6ad443c99cef14f0f7c2164aae375a52516a3f075c73bade58a2e4300eee4ddf1f30235839a122b9fc93e532072272b68ec84317665a529786564b46cf9be16')

package() {
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $pkgname-$pkgver-README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
