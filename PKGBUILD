# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.2.1
_pkgver=preview.1.26180.6
pkgrel=2
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
sha256sums_x86_64=('8d0ac3d53bc7361ddc812082244fc745f9d320f6776bac56c11b1ddb1905c369')
sha256sums_aarch64=('ed8d73d3d38df53705d6943fe6005f777b2ff2d01d683ea9a2ffa36ee75a077f')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}