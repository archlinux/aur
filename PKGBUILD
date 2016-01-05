# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.0.58
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('1f9bc71ca90b4e87a9ad63930dcf66e220a3f055a3abba99944c3436877ef84b761cd8e4221d348a1669e487a68bd6110f49aeae7ed4b9cee905048780e1b499')
source_x86_64=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_x86_64.tar.gz")
sha512sums_i686=('6ca0db1b0d3a172fced1724f7f4d7d495be107e8a16bbffcc4336a8ed60d72026a253b01b1b64c69c583e84dbf0c897ec7bbf5b5b51b1ab9321f68c800215d83')
source_i686=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

