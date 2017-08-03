# Maintainer: Fatih Bostancı <faopera@gmail.com>

pkgname=ezanvakti
pkgver=6.3.2
pkgrel=1
pkgdesc="Islamic Prayer Times bash script for Turkish users"
arch=('any')
url="https://gitlab.com/fbostanci/ezanvakti"
license=('GPL3')
makedepends=()
depends=('bash' 'sed' 'gawk' 'grep' 'libnotify' 'mplayer' 'perl-www-mechanize' 'yad')
optdepends=('bash-completion: bash tab completion support')
source=("https://github.com/fbostanci/ezanvakti/archive/v$pkgver.tar.gz")
md5sums=('6df6482bc652cb3b153f2cd78505fbda')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr sysconfdir=/etc DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
