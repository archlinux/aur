pkgname=wami-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Helps you find and remember the names of programs for specific tasks"
arch=('x86_64')
url="https://github.com/evait-security/wami"
license=('MIT')
provides=('wami')
conflicts=('wami')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}::https://github.com/evait-security/wami/releases/download/linux_x64/wami")

sha256sums=('c74d39f278a8270f5d357e693121b89cfecf1e14b25021b2b67f416f14789a10')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/wami"
}
