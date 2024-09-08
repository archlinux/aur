# Maintainer: Ali Atashrooz <atashroozarash@gmail.com>
# Contributor: Guillaume Boehm <aur@mail.gboehm.com>
pkgname="simple-sddm-theme-2-git"
_gitname="simple-sddm-2"
pkgver=_
pkgrel=1
pkgdesc="Simple theme variant for the SDDM Login Manager using Qt6"
arch=(any)
url="https://github.com/JaKooLit/${_gitname}"
license=(GPL3)
depends=('qt6-5compat' 'qt6-declarative' 'qt6-svg' 'sddm')
makedepends=(git)
backup=("usr/share/sddm/themes/${_gitname}/theme.conf")
source=("git+https://github.com/JaKooLit/${_gitname}")

package() {
        cd "${srcdir}"
        mkdir -p "${pkgdir}/usr/share/sddm/themes/"
        cp -r "${_gitname}/" "${pkgdir}/usr/share/sddm/themes/"
}
sha256sums=('SKIP')
