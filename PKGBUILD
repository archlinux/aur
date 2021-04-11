# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.19
pkgrel=0
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
source_i686=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-019b.gz)
sha256sums_i686=(2cf5ed4c407603344370fe50f00cedaa261363688326a1dc960dbed2d77d8634)
source_x86_64=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-019c-x64.gz)
sha256sums_x86_64=(b6a934b0decaab384562ec24c67bd2b65825c9adcac97ed49506fa6d76ec5439)
source_armv6h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
sha256sums_armv6h=(0a292022724a4b8fdbd566398f359c453099628f6d7201cfd0059ff409809016)
source_armv7h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-armv7.gz)
sha256sums_armv7h=(58ab53a8adffaa0ee2c6f2da088caf7c2f2000c930543bb842152509435320d8)

package() {
  gunzip -k -f "$pkgname-$pkgver.gz"
  install -m755 -D "$pkgname-$pkgver" $pkgdir/usr/bin/hdsentinel || return 1
}
