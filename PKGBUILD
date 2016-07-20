# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.40
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=2
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
sha512sums_x86_64=('c8b89e9922d997b00ee9f5ea8f6e67518e342b41dfd06aa30ad3bb09a13b31dc39b22f5269e4d602d44da686818b7a76610bf12a122cdd5bafe1179931b9d44e')
sha512sums_i686=('b41a4b69e054e0cbb5cccb3947b7c06aea4802fbff6012823d9bc27c1bc4587f77a85e6f3a0e62257de6448ac2ff6b7d7c80aac77536bc329545c94a15930073')
sha512sums_armv6h=('f6469ecd767903f464a2f0e263f3ad276bd5122c980c8dccdc68c6de1d6aad905e591920585b7a70bde7cb1f3d005dc65cf6d09203d9235cba4483a5561255ea')
sha512sums_armv7h=('041a715d2f411eee90150623dfba45ec3751cbd200b17ab09bc7de0dce254838d6024997443b80eba855fc5282a6ea85988772b31c8f1a070aabb82577f3b31b')
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

