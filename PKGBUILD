# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
_pkgname=aspire
pkgver=13.3.1
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
sha256sums_x86_64=('60e955ac31eee86f5bab65c761d49b6fb4f398fff076b71e6ef9d9621c40e06d')
sha256sums_aarch64=('ff08cd97c59b0d23dbb2a7a3d05dc160beb18160140fab76c21221e1bab60106')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
    install -Dm755 Aspire.TypeSystem.xml "$pkgdir/usr/bin/Aspire.TypeSystem.xml"
}