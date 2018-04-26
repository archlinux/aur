# Maintainer: Jakob Senkl jlp at live dot at

pkgname=brackets-bin-tsinghua
pkgver=1.12
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript."
arch=('x86_64')
url='http://brackets.io'
license=('MIT')
depends=('gconf' 'libgcrypt15' 'nodejs' 'nspr' 'nss' 'systemd')
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git' 'brackets-bin')
source=("https://mirrors.tuna.tsinghua.edu.cn/arch4edu/x86_64/brackets-1.12-2-x86_64.pkg.tar.xz")
sha512sums=('ddcdd83595167c55018c3d478379939c345ede0442d455544a41c316c7734edd9600be0ac27e2a28de32e44e80ce81339b65fe9fad9e551bf5acaf1e5a7e5efa')

package() {
  cd $srcdir
  msg2 "  -> Installing from package..."
  sudo pacman -U ./brackets-1.12-2-x86_64.pkg.tar.xz
}
