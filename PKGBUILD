pkgname=opsec
_pkgname=opsec
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for larp kings"
arch=('x86_64')
url="https://github.com/Naiko8642/opsec"
license=('MIT')
provides=('opsec')
conflicts=('opsec')
source=("${url}/releases/download/v${pkgver}/opsec-v${pkgver}-x86_64.tar.gz")
sha256sums=('fc57c986e08340c1e520996e4f4d6965a5dc530f7063519e246c19dfa2dfce7c')

package() {
    install -Dm755 "${srcdir}/opsec" "${pkgdir}/usr/bin/opsec"
}
