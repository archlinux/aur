# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha512sums=('16fc0c3794f77a0a2eaab167613f1ff655bd97b7714d67a89fa3dff375714846710149963eeeaea21e3e7ec70ecf1a02e18c2216eaab6191d60ac1552a54d741')
changelog='CHANGELOG.md'

package() {
    install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

