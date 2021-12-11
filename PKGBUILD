# Maintainer: NiceMicro <nicemicro@freemail.hu>

pkgname=adapta-gtk-theme-colorpack-joshaby-git
_gitname=Adapta-Colorpack
pkgver="202101191000"
pkgrel=1
pkgdesc="A beautiful GTK+ theme based in material design (git version from Joshaby)."
arch=('any')
url="https://github.com/Joshaby/Adapta-Colorpack"
license=('GPL2')
depends=()
optdepends=('ttf-roboto: recommended font'
            'noto-fonts: recommended font'
            'gtk-engine-murrine: for gtk2 themes')
provides=('adapta-gtk-theme-colorpack')
conflicts=('adapta-gtk-theme-colorpack')
source=("https://github.com/Adapta-Projects/${_gitname}/archive/refs/tags/202101191000.tar.gz")
sha256sums=('SKIP')
options=('!strip')

#pkgver() {
#  cd ${_gitname}-${pkgver}
#  git describe --long --tags | sed -e 's/^/1./;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

package() {
	cp -r "${_gitname}-${pkgver}/Pkg/usr" "${pkgdir}/usr"
}
	
