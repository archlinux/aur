# Maintainer: neolax <NEOLAX@proton.me>
pkgname=anihub-cli-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Unofficial terminal client for browsing and watching anime from AniHub (prebuilt binary)'
arch=('x86_64')
url='https://github.com/NEO-LAX/anihub-cli'
license=('MIT')
depends=('gcc-libs' 'mpv')
provides=("anihub-cli=$pkgver")
conflicts=('anihub-cli')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/anihub-cli-x86_64-unknown-linux-gnu")
sha256sums=('904efe94bb82661871085d8f7250a5355aed12433d9d291d0fbcb21ca5d90580')
sha256sums_x86_64=('00877edc1683d5ae41887fe09a7bbe4db554f9fdd653e6741de092780255cc1b')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/anihub-cli"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
