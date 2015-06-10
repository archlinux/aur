# Maintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>

pkgname=nomachine
pkgver=4.6.3
pkgrel=13
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
install=nomachine.install
md5sums=('71cb30177e1b0b105f5973e201daefbd')
source_x86_64=(http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${pkgrel}_${arch}.tar.gz)

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

