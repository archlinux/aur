# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.5.0
pkgrel=1
pkgdesc='Aspire provides tools, templates, and packages for building observable, production-ready distributed apps'
arch=('x86_64' 'aarch64')
url="https://aspire.dev/"
url="https://github.com/microsoft/aspire"
license=('MIT')
depends=('libsodium')
options=('!strip' '!emptydirs')
provides=('aspire')

source=("LICENSE.TXT")
source_x86_64=("https://github.com/microsoft/$_pkgname/releases/download/v$pkgver/$pkgname-linux-x64-$pkgver.tar.gz")
source_aarch64=("https://github.com/microsoft/$_pkgname/releases/download/v$pkgver/$pkgname-linux-arm64-$pkgver.tar.gz")

sha256sums=('ae48df11a335dc1a615f4f938b69cba73bcf4485c4f97af49b38efb0f216353b')
sha256sums_x86_64=('36306a0d08d08e110a1f0e27774385033c5b0b045f40ec6c182b2048b13a7808')
sha256sums_aarch64=('f395351bcddf323d56021e38829fda58fa901231d09d9f3ecf2591391ced6458')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    #install -Dm755 libhex1binterop.so "$pkgdir/usr/lib/libhex1binterop.so"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}