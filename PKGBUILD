# $Id: PKGBUILD,v 1.11 2006/05/22 17:38:11 uid1014 Exp $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: eric <eric@archlinux.org>
# Contributor Eddie Lozon <almostlucky@attbi.com>

pkgname=gkrellm-mailwatch
pkgver=2.4.3
pkgrel=2
pkgdesc="Gkrellm plugin to setup extra counters for your mailboxes"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gkrellm')
source=("http://gkrellm.luon.net/files/$pkgname-$pkgver.tar.gz")
url="http://gkrellm.luon.net/mailwatch.phtml"
md5sums=('f3f5edbf7f573067d9ef0486965e2fa1')

build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  install -D -m755 mailwatch.so "$pkgdir/usr/lib/gkrellm2/plugins/mailwatch.so"
}
