# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.2.4
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
sha256sums_x86_64=('740ebf2770c97cf266b0898fa25e1373386e92f7c148f7df6a7771257bb84a63')
sha256sums_aarch64=('8542255597553e42e85d19c2d1d6bc35bed7eb9b4762e8709d1614243c1a9ae0')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}