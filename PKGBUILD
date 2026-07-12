# Maintainer: tee < teeaur at duck dot com >
pkgname=memo-bin
pkgver=0.0.22
pkgrel=1
pkgdesc="📓 Memo Life For You"
arch=(x86_64)
url="https://github.com/mattn/memo"
license=(MIT)
source=("$url/releases/download/v$pkgver/memo_v${pkgver}_linux_amd64.tar.gz")
b2sums=('fc0ebb41683c66d0a1b6cb7ed7c036ea676c09d91b2d37afcb346171af596bf487ddc7f129b5e160062d43af0eae6b84509887389f655af11361cb427f50434d')

package() {
    cd "memo_v${pkgver}_linux_amd64"
    install -Dm755 memo -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
