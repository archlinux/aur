# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=1.3.11
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://github.com/Jaxx-io/Jaxx/releases/download/v${pkgver}/jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('3e3d172af34a1dd25e514dedf4aea9e44431fe7994044d04ff079b0edd623749')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
