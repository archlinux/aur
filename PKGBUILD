# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.0.47
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('cad1fb4a47b3a69d66530684e7fc95212e97b193d5f8589317a5a280d7114b852f289f5c009d88186dbfa7d7d0b7646e42bd77471e869eff1df711ef3ca37460')
source_x86_64=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_x86_64.tar.gz")
sha512sums_i686=('f468956017308a604adfb0cfc5279132e9196dfd1310674d8f349647c1835543cf19b0dd221909bdb2e67e4bd4d95b8e95d515637d292d2e07881b9c767b9060')
source_i686=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

