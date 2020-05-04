# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=ansiesc
pkgname=vim-$_modulename
pkgver=13.3
pkgrel=5
pkgdesc="ansi escape sequences concealed, but highlighted as specified (conceal) "
arch=(any)
url="https://github.com/powerman/vim-plugin-AnsiEsc"
license=()
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
sha256sums=('ed1871aa8cf2ed13d978bcc44f57a25d0e95144bcca19f7ea9f3e4e49ab622f1')
package() {
  cd "$srcdir/vim-plugin-AnsiEsc-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  find autoload doc plugin t -type d -exec install -d ${installpath}/{} \;
  find autoload doc plugin t -type f -exec install -Dm644 {} ${installpath}/{} \;
}
