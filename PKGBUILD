# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.9
pkgrel_i686=7
pkgrel_x86_64=6
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('64b83613d36797c3f6e9a09ac16f6764e3af2cd3f0fda0a54dbeeff36a7e6d410b878fba23475b505b54483700c5cc74e23d2fb4e9186cfdd45db7f17c651574')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
sha512sums_i686=('b11c0c57bce403cc89b82996a188008dca568569902cfeaf0a3fa600b86a438f952bef78e1a74eb31facece53a88c9922ca92673b81dbfab66e25d4b7e6610cb')
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

