# Maintainer: Edison Ibañez <edison@opmbx.org>
pkgname=sqlectron-gui
pkgver=1.17.0
pkgrel=2
pkgdesc="A simple and lightweight SQL client desktop with cross database and platform support."
arch=('i686' 'x86_64')
url="https://sqlectron.github.io/"
license=("MIT")

source=("Sqlectron.sh"
        "Sqlectron.desktop"
        "Sqlectron-16x16.png"
        "Sqlectron-24x24.png"
        "Sqlectron-32x32.png"
        "Sqlectron-48x48.png"
        "Sqlectron-64x64.png"
        "Sqlectron-96x96.png"
        "Sqlectron-128x128.png"
        "Sqlectron-256x256.png"
        "Sqlectron-512x512.png")
source_x86_64=("https://github.com/sqlectron/$pkgname/releases/download/v$pkgver/Sqlectron-$pkgver.tar.gz")
source_i686=("https://github.com/sqlectron/$pkgname/releases/download/v$pkgver/Sqlectron-$pkgver-ia32.tar.gz")
md5sums=('f0770e47e7ad5926d24cf9953c1ceb71'
         '59f6894e35ab7ce3da5ee594fad41ed4'
         '85d6ce586470159c1fc3722c0df19fa7'
         '3f2b8a5e1a3efa6fb2d40ff03f11475c'
         '2ead1b0701b8b251693f436b2a44ba87'
         '8f7c8a7de028f08063357a94f657282f'
         '45c7f72fa9db966e52bb55d4f2568ac5'
         '791f35bb9d3602620a0f2c3f7b9630ab'
         'b3e2568f1044efaa5113f1b14c51f377'
         'e1d936527e73ada838cd97b144c87174'
         'd68539a49b186bfdb4c461b0ee52442b')
md5sums_i686=('adb9e9cd2d6987ac4b9ac895099d3f09')
md5sums_x86_64=('68666c0e4f4b183b5a1baedfefb0405f')

depends=('libnotify')

package() {
  install -dm 755 "$pkgdir/opt"
  cp -rf "$srcdir/Sqlectron-$pkgver" "$pkgdir/opt/Sqlectron"
  install -dm 775 "$pkgdir/opt/Sqlectron"
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 775 "Sqlectron.sh" "$pkgdir/usr/bin/Sqlectron"
  install -Dm 644 "$srcdir/Sqlectron.desktop" "$pkgdir/usr/share/applications/Sqlectron.desktop"
  install -Dm 644 "$srcdir/Sqlectron-16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-96x96.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/Sqlectron-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/Sqlectron.png"
}

# vim:set ts=2 sw=2 et:
