# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: catwell <catwell@archlinux.us>
pkgname=sig2dot
pkgver=0.35
pkgrel=1
pkgdesc="Generates a graph of all of the signature relationships in a GPG/PGP keyring"
arch=('i686' 'x86_64')
url="http://www.chaosreigns.com/code/sig2dot/" 
license=('GPL')
depends=('perl')
source=(http://www.chaosreigns.com/code/sig2dot/sig2dot.pl)
md5sums=('f8714bb139dcdbeb81485c33e2234f21')

package() {
  install -D -m0755 sig2dot.pl $pkgdir/usr/bin/sig2dot
}
