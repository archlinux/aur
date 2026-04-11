# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.2.2
_pkgver=preview.1.26207.2
pkgrel=2
pkgdesc='Aspire provides tools, templates, and packages for building observable, production-ready distributed apps'
arch=('x86_64' 'aarch64')
url="https://aspire.dev/"
url="https://github.com/dotnet/aspire"
license=('MIT')
depends=('libsodium')
options=('!strip' '!emptydirs')
provides=('aspire')

source=("LICENSE.TXT")
source_x86_64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://ci.dot.net/public/${_pkgname}/${pkgver}-${_pkgver}/${pkgname}-linux-arm64-${pkgver}.tar.gz")

sha256sums=('ae48df11a335dc1a615f4f938b69cba73bcf4485c4f97af49b38efb0f216353b')
sha256sums_x86_64=('b54de54d92268987e9604eeb4b51c25fdabd03946fe26abf27cfffb31b0c0465')
sha256sums_aarch64=('11354abcbd74775638b966bc48bc08a1eedbf5ae638022f87d58218f873197a2')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}