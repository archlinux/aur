# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.44
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=3
pkgrel_armv7h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('a79b92c9910ddd3e70b1cea1f471ca14ba654308997cccb3f9d99163689960a1dde2b0ca520ad57d86eecb4a1c215e89fceb2cce91f507afc502d87f950ffb16')
sha512sums_i686=('c0195a3ffdf5337f6e2029c1f9bc723c5a3a40290c80415b122a4308ec307d7d1ab80e6064375c605b39e787d1a633e7a315885d8d3a975e54e34e2fc6eb881c')
sha512sums_armv6h=('449e71b7b73d7851bd89ddcfafdc22a33c06097e6ac48f8951ba62137e13717c50ae371b06456525328cc6b54703f6068d39e9c979094053e86e8ec644af465c')
sha512sums_armv7h=('9bebfca6dcc0daff7003c7ec45121678e10625f0495ce142df8bd53bdc54af66e7229ea26687e59a5d7795819fe6ccd6cfe38df03a1bb8f8effae8ee5b697777')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

