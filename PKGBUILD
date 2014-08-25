# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=jarexec
pkgver=2
pkgrel=1
pkgdesc="A desktop entry to run executable jar archives."
arch=('any')
url="https://aur.archlinux.org/packages/jarexec/"
license=('GPLv3')
depends=('java-runtime')
install=desktop.install
source=('jarexec.desktop')
md5sums=('7b8906df2a7f3865fefa5bf652013c01')

package() {
  install -Dm644 "$srcdir/jarexec.desktop" "$pkgdir/usr/share/applications/jarexec.desktop"
}
