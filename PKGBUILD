# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=wabbitemu
pkgver=1.9.5.20
pkgrel=1
pkgdesc='An emulator for Texas Instruments Calculators'
arch=('i686' 'x86_64')
url='https://wabbit.codeplex.com/'
license=('GPL')
depends=('wine')
source=(
  'http://buckeyedude.com/Revsoft/Wabbitemu/Wabbitemu.exe'
  'wabbitemu'
  )
md5sums=('6ff92cf1d489f8e74bf0271654e56c32'
         '1a1d0a376bf296da5cbcc5c9fcabe41c')

package() {
  mkdir -p $pkgdir/opt/wabbitemu
  install -Dm644 "$srcdir/Wabbitemu.exe" "$pkgdir/opt/wabbitemu/"
  install -Dm755 "$srcdir/wabbitemu" "$pkgdir/usr/bin/wabbitemu"
}
