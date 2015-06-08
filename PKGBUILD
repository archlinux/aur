# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=wabbitemu
pkgver=1.8.2.26
pkgrel=3
pkgdesc='An emulator for Texas Instruments Calculators'
arch=('i686' 'x86_64')
url='https://wabbit.codeplex.com/'
license=('GPL')
depends=('wine')
source=(
  'http://buckeyedude.com/Revsoft/Wabbitemu/Wabbitemu.exe'
  'wabbitemu'
  )
md5sums=('38d3d44e26651a09976bfb10efc237ee'
         '1a1d0a376bf296da5cbcc5c9fcabe41c')

package() {
  mkdir -p $pkgdir/opt/wabbitemu
  install -Dm644 "$srcdir/Wabbitemu.exe" "$pkgdir/opt/wabbitemu/"
  install -Dm755 "$srcdir/wabbitemu" "$pkgdir/usr/bin/wabbitemu"
}
