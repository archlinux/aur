# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=200808a
pkgrel=1
epoch=
pkgdesc="movie thumbnailer (mtn) -- saves thumbnails (screenshots) of movie or video files to jpeg files."
arch=('any')
url="http://moviethumbnail.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/moviethumbnail/movie%20thumbnailer%20linux%20binary/${pkgname}-${pkgver}-linux/${pkgname}-${pkgver}-linux.tgz")
noextract=()
md5sums=('acf9d06bf1c7a8f87ed9689110df2323')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver-linux"
	#make DESTDIR="$pkgdir/" install
	install -d "${pkgdir}/usr/bin/"
	install -Dm 755 mtn "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 doc/index.en.html "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 doc/changelog.txt "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 doc/todo.txt "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 doc/usage.en.html "${pkgdir}/usr/share/doc/${pkgname}/"
}
