# $Id: PKGBUILD,v 1.17 2006/05/22 17:38:11 uid1014 Exp $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: my64 <package@obordes.com>
# Contributor: Eddie Lozon <almostlucky@attbi.com>

pkgname=gkrellmms
pkgver=2.1.22
pkgrel=4
pkgdesc="GKrellm plugin which allows you to control XMMS from within GKrellm."
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2' 'xmms')
license=('GPL')
source=("http://gkrellm.luon.net/files/$pkgname-$pkgver.tar.gz")
url="http://gkrellm.luon.net/gkrellmms.phtml"
md5sums=('2739eaf7047d7c8d203111a3c2e7eb17')

build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  install -Dm755 gkrellmms.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellmms.so"
}
# vim: ts=2 sw=2 et ft=sh
