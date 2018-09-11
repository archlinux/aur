# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=xfce-terminal-onedark
pkgver=1.0
pkgrel=1
pkgdesc="One Dark theme for XFCE Terminal"
arch=('any')
url="https://rizwan-hasan.github.io/MagpieOS-Repository/xfce-terminal-onedark"
license=('GPL')
depends=('xfce4-terminal')
source=('onedark.theme.gz')
md5sums=('57c20192cc5d0470dd4b78331a99b5fd')

package() {
  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/share/xfce4/terminal/colorschemes/
  cp -v onedark.theme ${pkgdir}/usr/share/xfce4/terminal/colorschemes/
}
