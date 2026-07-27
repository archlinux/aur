# Maintainer: crynta <info@terax.app>
pkgname=terax-bin
_pkgname=terax
pkgver=0.8.6
pkgrel=1
pkgdesc="Open-source ultra-lightweight AI terminal emulator"
arch=('x86_64')
url="https://github.com/crynta/terax-ai"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
optdepends=('xdg-utils: for opening URLs')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::https://github.com/crynta/terax-ai/releases/download/v${pkgver}/Terax_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    bsdtar -xf "$pkgname-$pkgver.deb"
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
