# Maintainer: neolax <NEOLAX@proton.me>
pkgname=anihub-cli-bin
pkgver=0.8.0
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
sha256sums_x86_64=('c8d4d612d1c731b5e8ec412b0cb6c8c95c2d1cc23b963a84f5b32cbfb0cb1b3e')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/anihub-cli"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
