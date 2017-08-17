# Maintainer: Fatih Bostancı <faopera@gmail.com>

pkgname=ezanvakti
pkgver=6.3.4
pkgrel=2
pkgdesc="Islamic Prayer Times bash script for Turkish users"
arch=('any')
url="https://gitlab.com/fbostanci/ezanvakti"
license=('GPL3')
makedepends=()
depends=('bash' 'sed' 'gawk' 'grep' 'libnotify' 'mplayer' 'perl-www-mechanize' 'yad')
optdepends=('bash-completion: bash tab completion support')
source=("https://github.com/fbostanci/ezanvakti/archive/v$pkgver.tar.gz")
md5sums=('ad5c89570a8d18e1ab0f7c4b218afe8c')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr sysconfdir=/etc DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
