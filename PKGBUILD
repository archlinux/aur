# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Maintainer: Archttila <linux.alucard@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.20
pkgrel=0
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
source_i686=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-019b.gz)
sha256sums_i686=(2cf5ed4c407603344370fe50f00cedaa261363688326a1dc960dbed2d77d8634)
source_x86_64=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-020-x64.zip)
sha256sums_x86_64=(c88b94e897609f5cf46b535d8382b35ccf00d415ea139924baa9f215b90a0878)
source_armv6h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
sha256sums_armv6h=(0a292022724a4b8fdbd566398f359c453099628f6d7201cfd0059ff409809016)
source_armv7h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-armv7.gz)
sha256sums_armv7h=(82e77b011030d99c4c784a72979cad520196eb520a8727f0d325431902914fc3)

package() {
  gunzip -k -f "$pkgname-$pkgver.gz"
  install -m755 -D "$pkgname-$pkgver" $pkgdir/usr/bin/hdsentinel || return 1
}
