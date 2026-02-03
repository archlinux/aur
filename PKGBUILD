# Maintainer: tee < teeaur at duck dot com >
pkgname=quary-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Business Intelligence for Engineers"
arch=(x86_64)
url="https://github.com/quarylabs/quary"
license=('Apache-2.0')
provides=('quary')
conflicts=('quary')
source=("$url/raw/v$pkgver/LICENSE")
source_x86_64=("quary-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/quary-linux-$CARCH-gnu.zip")
sha256sums=('954c30259208c39cf74febfd8e7466e1a9bf6479c6aa7a7e85f1e39afce7bda7')
sha256sums_x86_64=('054171fc14c425724b4f7d245b197f53b3b9d13f4810e9598603871137af6219')
#options=(!strip)

package() {
    install -Dm755 quary -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
