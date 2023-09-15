# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.11
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('4fc2cefee7b64df37ea3d4f9eb999075a7382591c25550dba5d4f6cd17a2692934377f54f513fdb18729ba555a45a554b98190407b70126f7e5d1205c4deb079')
b2sums_aarch64=('6ee781f2b02b7b4a2eeeeb50b7c7bba0655a9111c5c6ad7d9202c687575eefd2f1ec51e767d8b4696c058919626022719c60f13d3d252f854d2d647cbadaeaf3')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
