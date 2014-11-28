# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=w2do
pkgver=2.3.1
pkgrel=2
pkgdesc="A simple-to-use commandline todo manager that can export to HTML and plain text"
arch=('any')
url="http://w2do.blackened.cz/"
license=('GPL3')
depends=('perl')
source=(http://w2do.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha256sums=('59ed2c75446fa7456b4252e602265477538c02e64f00e3c7f61cc4d9ad8e5c02')

package() {
  cd $pkgname-$pkgver

  make INSTALL=/usr/bin/install \
       POD2MAN=/usr/bin/core_perl/pod2man \
       prefix=${pkgdir}/usr \
       install
}
