# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides-bin
pkgver=0.7.3
pkgrel=1
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha512sums=('b0c2a9540800d8a27a7c315938406c84316616682937490d34435a1e55916b6bd32eb652d34a48794c448d4d72d6b803980c88c16d2ab9fb55bed2ac2739f32d')
changelog='CHANGELOG.md'

package() {
    install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

