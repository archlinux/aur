# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-active-application
pkgver=0.2
pkgrel=1
pkgdesc="KDE plasma applet to show the active application name. Thought to be used in a panel together with plasma's global menu"
arch=(x86_64)
url="https://github.com/kupiqu/plasma-active-application"
license=(GPL)
depends=(plasma-workspace)
source=("https://github.com/kupiqu/plasma-active-application/archive/v$pkgver.tar.gz")
sha512sums=('f478eeac90801c35d4a8b0717603d8e60943d1841f567835a2cbc83c7246af30681cec90b4538671ee86fc986af093db3c4297f6fa663020a63cd4d9ba1857f8')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.activeApplication"
  mkdir -p "$_pkgdir"
  cp -r plasma-active-application-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
