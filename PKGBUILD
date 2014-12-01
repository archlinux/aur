# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=flactagger
pkgver=3.1.1
pkgrel=1
pkgdesc="A Ruby script for tagging FLAC files"
arch=('any')
url="http://sourceforge.net/projects/flactagger.berlios"
license=('GPL3')
depends=('ruby' 'flac')
source=(http://sourceforge.net/projects/flactagger.berlios/files/$pkgname-$pkgver.tar.bz2)
md5sums=('72282bb6b0b7a29249f9193795cd6d6e')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix="${pkgdir}"
}
