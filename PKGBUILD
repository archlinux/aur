# Maintainer: Your Name <hexisXz https://github.com/hexisXz>
pkgname=hexpmg
pkgver=1.14
pkgrel=1
epoch=
pkgdesc="a simple package manager that builds programs from source"
arch=(x86_64 i686)
url="https://github.com/hexisXz/hexpmg.git"
license=('GPL')
groups=()
depends=()
makedepends=(git axel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.13.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
      cd hexpmg 
      touch ~/hexpmg-list && chmod +x hexpmg && sudo mv hexpmg /bin && mkdir ~/.config/hexpmg/ && mv update ~/.config/hexpmg/ && mv uninstall ~/.config/hexpmg/

}



package() {
        chmod +x ~/.config/hexpmg/uninstall && chmod +x ~/.config/hexpmg/update

}
