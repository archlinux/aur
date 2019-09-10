# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=vimteractive
pkgname=vim-$_modulename
pkgver=2.0.1
pkgrel=1
pkgdesc="Send commands from text files to interactive programs via vim"
arch=(any)
url="https://github.com/williamjameshandley/vimteractive"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1c2970f929e3e9a0efcc8c8d52f7ad929b9d33329a258365d989ff02e472d6b9')

package() {
  cd "$srcdir/$_modulename-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/plugin/ $installpath/doc/ $installpath/autoload/
  install -Dm644 plugin/* $installpath/plugin/
  install -Dm644 doc/* $installpath/doc/
  install -Dm644 autoload/* $installpath/autoload/
}
