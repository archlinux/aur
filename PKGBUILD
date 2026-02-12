# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.1.1
_pkgver=preview.1.26105.8
pkgrel=1
pkgdesc='Aspire provides tools, templates, and packages for building observable, production-ready distributed apps'
arch=('x86_64' 'aarch64')
url="https://aspire.dev/"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('aspire')

source=("LICENSE.TXT")
source_x86_64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-arm64-${pkgver}.tar.gz")

sha256sums=('ae48df11a335dc1a615f4f938b69cba73bcf4485c4f97af49b38efb0f216353b')
sha256sums_x86_64=('7943ed62f9ab14cd78f3ce546a82b572cb21887b6f582e6de01a948d294e0473')
sha256sums_aarch64=('2c091eb532a884c0d1702cd119f436868dea07d5d68e8f715198c57d7356e28c')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
}