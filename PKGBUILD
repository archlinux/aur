pkgname=noverify-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Pretty fast linter (code static analysis utility) for PHP"
arch=(x86_64)
url="https://github.com/VKCOM/noverify"
license=('MIT')
provides=(noverify)
conflicts=(noverify noverify-git)
source=("https://github.com/VKCOM/noverify/releases/download/v${pkgver}/noverify-linux-amd64.zip")
sha256sums=('121cac0d717946446ff30f97cc1a07f2ae79626fdd3bbbd62075e6f28fd7afaf')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $srcdir/noverify "${pkgdir}/usr/bin/noverify"
}
