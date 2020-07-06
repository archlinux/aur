# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.18
pkgrel=5
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
source_i686=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018c.gz)
sha256sums_i686=(43a4423cd533e23aa1a05e74ba45529c6a474094720e902592a2522f8deb5704)
source_x86_64=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018c-x64.gz)
sha256sums_x86_64=(8f0d8b689d596b8d94d47494e80bfc7201d6dea67522e6ca564a2c0875d7c8e4)
source_armv6h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
sha256sums_armv6h=(0a292022724a4b8fdbd566398f359c453099628f6d7201cfd0059ff409809016)
source_armv7h=($pkgname-$pkgver.gz::https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
sha256sums_armv7h=(0a292022724a4b8fdbd566398f359c453099628f6d7201cfd0059ff409809016)

package() {
  gunzip -k -f "$pkgname-$pkgver.gz"
  install -m755 -D "$pkgname-$pkgver" $pkgdir/usr/bin/hdsentinel || return 1
}
