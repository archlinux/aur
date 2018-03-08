# Maintainer: Chris Tam <lchris314 at gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alexej Magura <sickhadas.nix*gmail*>

pkgname=libtinfo5
pkgver=5
pkgrel=20
pkgdesc="symlink to ncurses for use in cuda and other packages (legacy)"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('ncurses')

package() {
    error "libtinfo.so.5 is provided by ncurses5-compat-libs, please do not use dangerous symlinks"
    return 1
}
