# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha512sums=('489b8307887be9c695641a4856b4f5bc7748be58077d84e7488a993308c2026948b03543e7970279d39c39cccf55c9ec33554d03d85adbe899e15a4886a20250')
changelog='CHANGELOG.md'

package() {
    install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

