# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.2.1
_pkgver=preview.1.26180.6
pkgrel=1
pkgdesc='Aspire provides tools, templates, and packages for building observable, production-ready distributed apps'
arch=('x86_64' 'aarch64')
url="https://aspire.dev/"
license=('MIT')
depends=('libsodium')
options=('!strip' '!emptydirs')
provides=('aspire')

source=("LICENSE.TXT")
source_x86_64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-arm64-${pkgver}.tar.gz")

sha256sums=('ae48df11a335dc1a615f4f938b69cba73bcf4485c4f97af49b38efb0f216353b')
sha256sums_x86_64=('050743ad716c364ccf09d3cdc3b2bb5983f296df3127b54c4d058dd15e6d7b3c')
sha256sums_aarch64=('7ee0855fa8296d23f27d75668d35b351d0b3af810c6cfed2f0a6cd34d2f81b3d')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}