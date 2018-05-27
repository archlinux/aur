# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=vimteractive
pkgname=vim-$_modulename
pkgver=0.2
pkgrel=0
pkgdesc="Send commands from text files to interactive programs via vim"
arch=(any)
url="https://github.com/williamjameshandley/vimteractive"
license=('')
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
sha256sums=('83eb0f11de05e133df72d21fa827b8e4f71c89c8a45cb06de6bff03d7eacbf38')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/plugin/ $installpath/doc/
  install -Dm644 plugin/* $installpath/plugin/
  install -Dm644 doc/* $installpath/doc/
}
