# Maintainer: Yash <xofficialyashx@gmail.com>
pkgname=fastsetup
pkgver=1.0.0
pkgrel=1
pkgdesc="Bootstrapper that clones archDots and runs its install script"
arch=('any')
url="https://github.com/yuishigam1/fastsetup"
license=('MIT')
depends=('git' 'rsync') # rsync is used by archDots/install.sh
optdepends=('yay: AUR helper to install packages from AUR')
provides=('fastsetup')
conflicts=('fastsetup-git')
source=('install.sh')
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/install.sh" "$pkgdir/usr/bin/fastsetup"
}
