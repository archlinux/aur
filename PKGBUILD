# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-gt3
pkgver=2.0
pkgrel=1
pkgdesc="GT3 cursor theme."
arch=('any')
url="http://xfce-look.org/content/show.php/GT3?content=106536"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106536-GT3-colors-pack.rar")
md5sums=('d72db50b650325c4679d5759d2fe8127')

build() {
    cd ${srcdir}

	tar xvf GT3.tar.gz
}

package() {
    cd ${srcdir}

	install -dm755 ${pkgdir}/usr/share/icons/
    cp -vR GT3 ${pkgdir}/usr/share/icons/
}

# vim:set ts=4 sw=4 et:
