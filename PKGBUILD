# Maintainer: hanker <91734413+hankertrix@users.noreply.github.com>
# Contributor: Perseo <perseo.gi98@gmail.com>
pkgname=xsct
pkgver=2.3
pkgrel=2
_git_name=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${_git_name}"
license=('Unlicense')
depends=('glibc' 'libx11' 'libxrandr')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/faf0/${_git_name}/archive/${pkgver}.tar.gz")
sha512sums=('8bedce06d53c00967b61d0254dc755a7b71f00a28800cecc3a34694a8b424374b843acc5eaebbc525c6771ce93dfd42585ae8723e70a73728d98de8b2dfc70f9')

package() {
	cd "$srcdir/${_git_name}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
