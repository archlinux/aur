# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.54
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=1
pkgrel_armv7h=1
pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('7e8c1651582bb07aa5e54568df8186a132f353078b73069dc5b9885ae31df892c842588d77531dc79c6a5d5f2390e7a90200a057164ce1cf16df5872d2e2525a')
sha512sums_i686=('a8b3ed882c767e2ecb72771aedec810c2e6067e3e9c973968873ea611a40a70c8d23d8f2a73d7bb900511fef986c003cb9150bea39d5ac90e450169111458251')
sha512sums_armv6h=('c7a945298b9f79967f4a2b456701478e58f941a9bc73291750fba3d84a59cf0fdea232ce9382cd9c4252931ed27140efe9a2340dff809f06b6656f66b68c4c35')
sha512sums_armv7h=('4b3a681635a27cd4ef090ddaadd3a77c42912df38b910a1fb25dd7d951cde3b9f69659c2f9e78368f4c999516ce7073846ed3f26dfda82d24f9f3e3b3063db4b')
sha512sums_armv8h=('5612d533085cef92fcf31a8a3b20f12d736f73fcfcb7ca92ad2a3f878f5e7bc50ad6051ebc9b34317ab6dd345427f21c103986e10257271c33b0bed093d4fa70')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv8h}_aarch64.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

