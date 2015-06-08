# Maintainer: faerbit <faerbit at gmail dot com >

pkgname=multigpg
pkgver=1.0
pkgrel=2
pkgdesc="A simple script that handles modifying the contents of a GPG encrypted archive."
arch=("any")
url="https://github.com/Faerbit/MultiGPG"
license=("custom:'BEERWARE'")
depends=("gnupg")
source=("https://github.com/Faerbit/MultiGPG/archive/RELEASE-$pkgver.zip")
md5sums=('563f79277bb95c922be0d48e402bdc0f')
sha1sums=('2d8ead5c757e7908fbeea1728a4a1999776edaeb')
sha256sums=('e4cc6141307c39921c12a81a3c1ef133e6ecdd24622e7b770e3e165f8b1d04c2')
sha384sums=('3d4d46472b47954de06be7f0dc88252c5136ed46dbae3d9b7f741f2bcd1e7cd6519df222cbc48d931816a6b2d3b2e707')
sha512sums=('fc0d6dc784d4e28668b31afe9c03243cd157006619fabffafbb62511c7a030aa9a85ca595af82c6844978c066f35e5f28dd022aa4c2d33e79e1888e74ffd96fa')

package(){
    cd "$srcdir/MultiGPG-RELEASE-$pkgver"
    install -D multigpg "$pkgdir/usr/bin/multigpg"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
