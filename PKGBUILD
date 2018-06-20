# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=vimteractive
pkgname=vim-$_modulename
pkgver=1.0
pkgrel=0
pkgdesc="Send commands from text files to interactive programs via vim"
arch=(any)
url="https://github.com/williamjameshandley/vimteractive"
license=('GPL')
groups=()
depends=('')
makedepends=('vim')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d215d207c2b49ec69bad9a26da662380e3cbb7e0c762dcca0825a5e61fb79af4')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/plugin/ $installpath/doc/
  install -Dm644 plugin/* $installpath/plugin/
  install -Dm644 doc/* $installpath/doc/
}
