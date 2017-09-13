# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=numix-kde-theme-git
gitname=numix-kde-theme
pkgver=r13.58d001f
pkgrel=1
pkgdesc="Numix pack for KDE - Git version"
arch=('any')
url="https://github.com/varlesh/numix-kde-theme"
license=('GPL3')
depends=('numix-circle-icon-theme-git')
optdepends=('numix-gtk-theme-git') 
makedepends=('git')
source=("git+https://github.com/varlesh/numix-kde-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
  


	package() {
	mkdir -p "$pkgdir/usr/share"
    cp -r "${srcdir}/${gitname}/color-schemes" "$pkgdir/usr/share/"
    cp -r "${srcdir}/${gitname}/plasma" "$pkgdir/usr/share/"
	
}
