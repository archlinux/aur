# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.1.2
_pkgver=preview.1.26125.13
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
sha256sums_x86_64=('71609a41c650ab161e48da6e1e38970f57b32c70ac26d38895522ee4346a3629')
sha256sums_aarch64=('7a83039f8d3a57ac5c4fb1f38e9bd22553d247f1f18e20bbfdcd0822e98fa90f')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
}