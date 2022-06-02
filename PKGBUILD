# Maintainer: kormpu mcgpapu@gmail.com

pkgname="ttf-encom"
pkgdesc="patched encom ttf font"
pkgver=1.0
pkgrel=1
arch=('any')
url="http://disneydigitalbooks.go.com/tron"
source=("git+http://github.com/papuSpartan/ttf-encom.git")
license=('OFL')
depends=('fontconfig' 'xorg-mkfontscale')
makedepends=('unzip')
b2sums=('SKIP')

package() {
install -Dm644 -v "${srcdir}/ttf-encom/Encom-Patched.ttf" -t "$pkgdir/usr/share/fonts/${pkgname}"
install -Dm644 -v "${srcdir}/ttf-encom/README.md" -t "$pkgdir/usr/share/doc/${pkgname}"

#install -Dm644 -v "${srcdir}/ttf-encom/License.txt" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
