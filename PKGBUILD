# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=jarexec
pkgver=3
pkgrel=1
pkgdesc="A desktop entry to run executable jar archives."
arch=('any')
url="https://aur.archlinux.org/packages/jarexec/"
license=('GPLv3')
depends=('java-runtime')
install=desktop.install
source=('jarexec.desktop')
md5sums=('4544709b25326edb0e7ce2e8def0a67e')

package() {
  install -Dm644 "$srcdir/jarexec.desktop" "$pkgdir/usr/share/applications/jarexec.desktop"
}
