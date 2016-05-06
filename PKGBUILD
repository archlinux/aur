# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.26
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=6
pkgrel_armv7h=5
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('fa31b1048faa5389b8137ad7b9dd83719efa42fdeab6bcf0db17e8187a62f4ab92f94a5496949b2396e57eb0e59b409cac1fa1e91436719d8b9a6b2c7821a655')
sha512sums_i686=('e5ec53743333d778ef4448ac981ab6a9bc45df85c52b659e7c50c0e20c6737a8ba0d7f64906c570180e7978a3c446f726f8e5d9f3c2c722bdb76f50ccbb722e7')
sha512sums_armv6h=('547731030692f4057959492cb963bc3195049948c988edbab700a95078c7b119f78d6988287469f44b24b9d2e17adc2678e29565bfa1bbf659a83c23c9a71509')
sha512sums_armv7h=('9d563e73515634979026d780b03877c15619e4cfbf9fcac3c245d3f2cf9ff6c86ecc4f7dfed2bb5ab66f7d46de447fc5307a75c5a0bdd7c41aff2d24a416766c')
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

