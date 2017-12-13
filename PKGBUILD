# Maintainer: Andrew Webley <UnsuspectingHero@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=imdb-thumbnailer
pkgver=0.8.9
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="A nautilus / thunar video thumbnailer that sets film covers as thumbnails"
install=$pkgname.install
url="https://launchpad.net/$pkgname"

source=("http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname.$pkgver.tar")

md5sums=('129bf02a383911783c44b4df32f55c4f')

optdepends=('nautilus: to view thumbnails with'
			'thunar: to view thumbnails with')

package(){
    install -m755 -Dt "${pkgdir}/usr/bin/" "${srcdir}/package/usr/bin/${pkgname}"

    install -m644 -Dt "${pkgdir}/usr/share/applications/" \
        "${srcdir}/package/usr/local/share/thumbnailers/imdb.desktop"
}
