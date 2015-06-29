# Maintainer: Denis Falqueto <denisfalqueto@gmail.com>
pkgname=toolsched
pkgver=0.17
pkgrel=2
pkgdesc="Simple scripts for automatically starting commands as either SCHED_BATCH, SCHED_ISO or SCHED_IDLEPRIO."
arch=('any')
url="http://ck.kolivas.org/apps/toolsched/"
license=('GPL')
depends=('bash' 'schedtool')
source=(
http://ck.kolivas.org/apps/toolsched/$pkgname-$pkgver/readme.txt
http://ck.kolivas.org/apps/toolsched/$pkgname-$pkgver/toolsched.b
http://ck.kolivas.org/apps/toolsched/$pkgname-$pkgver/toolsched.d
http://ck.kolivas.org/apps/toolsched/$pkgname-$pkgver/toolsched.i
http://ck.kolivas.org/apps/toolsched/$pkgname-$pkgver/toolsched.n
)
md5sums=('5e30f33e0661cb33bb425f838e5cc86d'
         'ca134b67aed53862cf969c99c83a449f'
         '158b0317d00d6d45600f2521adff7fd6'
         '43a877963bdeb1691296f0619ba6fc1e'
         'fb95943b0133795e674c437b58003f0b')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin"
  install -m 755 toolsched.* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/doc/toolsched"
  install -m 644 readme.txt "$pkgdir/usr/share/doc/toolsched"
}

# vim:set ts=2 sw=2 et:

