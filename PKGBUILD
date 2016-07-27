# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.42
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
sha512sums_x86_64=('d3a7de13f1087f1afea4941bb65fb716119987e2f413028a46c947498f0ccc232075bc0b8d040f15c9616c62691b876e1781e18584da83263b525addc77c0a8a')
sha512sums_i686=('9c1b4b3bb0e7219a1e96048aae775cff76f63e7ef2129f73b27520f326653d353fd06d1f8ed214f48891cd087723e4b8b9f6820341c866d814d1dc5375fc3ccf')
sha512sums_armv6h=('4ebb9408783731a858733032753854a83152597e8077dbc526c66333d09ae17529750c08278636d181fbf36530cf1beb7975f7710fe6bfce667d4fd2df7e010a')
sha512sums_armv7h=('7bf001d4846ebc5d2602c41ff93caf55f9e4f5b6ac986204648601bc0281e1141a3b569b166f504d4c431959d23a13abd1568406ab6581a9f428814e16be5284')
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

