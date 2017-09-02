_pkgbase='suru-icon-theme'
_git='snwh'
pkgname="$_pkgbase-git"
arch=('any')
pkgver=1
pkgrel=1
source=("git+https://github.com/$_git/$_pkgbase.git")
md5sum=('SKIP')

package() {
cd $_pkgbase
make install-root
}
