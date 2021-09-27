pkgname=noverify-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Pretty fast linter (code static analysis utility) for PHP"
arch=(x86_64)
url="https://github.com/VKCOM/noverify"
license=('MIT')
provides=(noverify)
conflicts=(noverify noverify-git)
source=("https://github.com/VKCOM/noverify/releases/download/v${pkgver}/noverify-linux-amd64.zip")
sha256sums=('184d4ea250e024bb71d589715c03eb923e6653a4aaa32e76300ee07a37b70daf')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $srcdir/noverify "${pkgdir}/usr/bin/noverify"
}
