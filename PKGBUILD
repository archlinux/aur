# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.7
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
sha512sums_x86_64=('1da70714fe9c365f38c6e95344ea16d3d7842d4e5fabbdca996459adea41038670760ffaecac21e7e128dcde48ddaf7d4c864959fe8b9e014f0908fdb12fb655')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
sha512sums_i686=('c1f7fbe5c65fb8bfd424ec11cf66a5bdc25883beb18d311b4a2cc942266322ff0c3c1569ce8b037e998dbdd32f3a9957fe27ad75b728c06942a3ee04e1907184')
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

