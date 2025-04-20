# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Marco Curreli <marcocurreli@tiscali.it>

pkgname=stardict-oald
pkgver=2.4.2
pkgrel=11
pkgdesc="Oxford Advanced Learner's Dictionary for Stardict"
license=('freeware')
arch=('any')
depends=('stardict')
url="https://code.google.com/archive/p/stardict-3/"
md5sums=('9fed81952687bb61a791fcd4c774057d')
source=(http://web.archive.org/web/20230718140437/http://download.huzheng.org/bigdict/stardict-Oxford_Advanced_Learner_s_Dictionary-2.4.2.tar.bz2)

package() {
	mkdir -p "$pkgdir/usr/share/stardict/dic/oald"
  cd stardict-Oxford_Advanced_Learner_s_Dictionary-"${pkgver}"/
  install -m 644 *.dict.dz *.idx *.ifo "$pkgdir/usr/share/stardict/dic/oald/"
}

# vim:set ts=2 sw=2 et:
