pkgname=ytp+
pkgver=1.0.2
pkgrel=1
pkgdesc="The nonsensical video generator"
arch=('any')
url="https://ytp-plus.github.io/"
license=('GPL3')
depends=('nodejs>=17.0.0', 'git>=2.0.0', 'curl>=7.0.0', 'love>=11.0.0')
source=("https://github.com/YTP-Plus/YTPPlusLauncher/releases/download/v1.0.2/YTPPlusLauncher.love" $pkgname.png $pkgname.desktop)
noextract=('YTPPlusLauncher.love')
md5sums=('ed6fef54c865eedef3447cbcc134ef06' 'SKIP' 'SKIP')

package() {
  local dst="${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${dst}"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/share/applications/"

  cp YTPPlusLauncher.love $dst
  cp $srcdir/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  cp $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
