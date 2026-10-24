# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.6.4
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
sha256sums_x86_64=('4d875fa954dc4385b2ef08c03fd9c3546819fda9b669d43bd96fa3354487cfb3')
sha256sums_aarch64=('7520bedd8d67d62b528358caadb8133ad1452b691a8e925086d737612746d723')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 libhex1binterop.so "$pkgdir/usr/lib/libhex1binterop.so"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}