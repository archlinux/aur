# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=nicotine+
pkgver=1.4.1
pkgrel=4
pkgdesc='Soulseek music-sharing client, written in python'
arch=(any)
url='https://github.com/Nicotine-Plus/nicotine-plus'
license=(GPL)
depends=(python2-mutagen pygtk)
optdepends=('python2-geoip: to enable Geographical blocker')
conflicts=(nicotine)
replaces=(nicotine)
source=($pkgname-$pkgver::"https://github.com/Nicotine-Plus/nicotine-plus/archive/$pkgver.tar.gz")
sha256sums=('1b38ef196d981e4eb96fa990cc463143289784f988f559c4400b1d461497b7d6')

package() {
  cd nicotine-plus-$pkgver

  python2 setup.py install --root="$pkgdir"
}
