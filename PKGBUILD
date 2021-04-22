# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: dale <dale@archlinux.org>

pkgname=mozilla-common
pkgver=1.4
pkgrel=6
pkgdesc="Helper for forks of the Mozilla codebase which still support NPAPI"
arch=('any')
license=('GPL')
url="https://www.mozilla.org/"
install=mozilla-common.install
source=('mozilla-common.sh'
        'mozilla-common.csh')
md5sums=('39451f6fe87d3cb224e140322c55eb27'
         '924887e41bd96db37029f479befe40cf')

package() {
  install -d "${pkgdir}/etc/profile.d/"
  install -m755 mozilla-common.{,c}sh "${pkgdir}/etc/profile.d/"
}
