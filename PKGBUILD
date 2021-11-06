# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha512sums=('2d1182cc5aa53849a31ac93c4fff7ba90dedbee36d4d78a644bb421d724414741b66ee9c457198c5fb446428a283dd85a588d480f17d8444a9b8df0a85b694b8')
changelog='CHANGELOG.md'

package() {
    install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

