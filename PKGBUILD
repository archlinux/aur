# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=vimteractive
pkgname=vim-$_modulename
pkgver=1.3
pkgrel=1
pkgdesc="Send commands from text files to interactive programs via vim"
arch=(any)
url="https://github.com/williamjameshandley/vimteractive"
license=('GPL')
groups=()
depends=('vim')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3dd589f68559f4b4e158f3b32c4ea47ef4f8366b0d10a349b86ca80ff74d324b')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/plugin/ $installpath/doc/
  install -Dm644 plugin/* $installpath/plugin/
  install -Dm644 doc/* $installpath/doc/
}
