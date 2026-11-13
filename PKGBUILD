# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.6.5
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
sha256sums_x86_64=('6e22bd4daaa62d09320638246e57bfaf56ed147a3a87cdd5eafec277726ca978')
sha256sums_aarch64=('b210c3652693ae54fb3558c75b70f90439be5fe8125acf78f92269ab96958623')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 libhex1binterop.so "$pkgdir/usr/lib/libhex1binterop.so"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}