# Maintainer: tee < teeaur at duck dot com >
pkgname=memo-bin
pkgver=0.0.20
pkgrel=1
pkgdesc="📓 Memo Life For You"
arch=(x86_64)
url="https://github.com/mattn/memo"
license=(MIT)
source=("$url/releases/download/v$pkgver/memo_v${pkgver}_linux_amd64.tar.gz")
b2sums=('fa82d3b43b492e0a1007f9ac0a5bbee159096cba6e40955bd3066753ea4cb5391d7cc3e1eaa6b1a01b531bf04548d2c7f0c2fcaf4e0434c471028726365deddd')

package() {
    cd "memo_v${pkgver}_linux_amd64"
    install -Dm755 memo -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
