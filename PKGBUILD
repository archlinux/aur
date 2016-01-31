# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.0.63
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('1f478acade9a7cda8c1e34edeb5d16aa6c2a18479fcfbe24bb6edbeeccff8456f44153d771749745eda80ab44972a01e1ceca457eb265825e161d6d25fa86363')
source_x86_64=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_x86_64.tar.gz")
sha512sums_i686=('c519b3c51c0d12bd4b357a59302f80962a01a9e8c46be1f61b500a92490f27883ed5245ef132d4dbf7de1ab2efa2b85d181854e11a5bcd70c7e7271e263c8c3f')
source_i686=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

