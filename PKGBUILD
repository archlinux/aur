# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.22
pkgrel_i686=7
pkgrel_x86_64=5
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('dd66df89f737764a2c44d92fb79c57e30f524772bb30a79d4f8d6b25fa8e7501b4a633f9ae10736df335e6150d1a6a08fffccdc5849bc0acc723128b05347b54')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
sha512sums_i686=('8a28805ae47bbf2d1ba6d6592dc7e61d743b707b4ba2a6fcfce8ad5b83679c991019938ab2c1e61c8d871dd173d2b1b6ffeb754ed68aa300fe2bff61112746f4')
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

