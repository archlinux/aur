# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.0.53
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('7f69f4383f0e8c307ebee280ca3913df7539063c33b214bdee151134c88eb9d8e0dbbe0c7ea60424512f504fac7946c8cb282db04d9a3eebfeb38e6d1cfedb6e')
source_x86_64=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_x86_64.tar.gz")
sha512sums_i686=('9a13d5d94d6506028a671c0858e5146ba32e9e4e9794126baa544c408f7cd183af3af6f2225f89fe9b6f8745f17ad609757a01c990444bcf61520347d3d2cc44')
source_i686=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

