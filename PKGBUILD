# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=noverify-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Pretty fast linter (code static analysis utility) for PHP"
arch=(x86_64)
url="https://github.com/VKCOM/noverify"
license=('MIT')
provides=(noverify)
conflicts=(noverify noverify-git)
source=("https://github.com/VKCOM/noverify/releases/download/v0.2.0/noverify-${pkgver}-linux-amd64.tar.gz")
sha256sums=(SKIP)

package() {
    install -Dm755 "noverify-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/noverify"
}
