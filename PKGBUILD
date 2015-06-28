# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Vincent Demeester <vincent@sbr.pm>
pkgname=praetorian
pkgver=0.1.1
pkgrel=1
pkgdesc="A ssh praetorian (bouncer, minder or whatever) ; it's just a cool restricted command script."
arch=('any')
url="http://github.com/vdemeester/praetorian"
license=('GPLv3')
depends=('openssh' 'coreutils')
provides=('praetorian')
conflicts=('praetorian')
source=($url/tarball/$pkgver)
md5sums=(c8cac0a2a334f4733ba7fab61dfc0670)

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "$pkgver"
}

package() {
  cd $srcdir

  make install-bin prefix=$pkgdir
}

# vim:set ts=2 sw=2 et:
