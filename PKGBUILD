# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-armv7l
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-armv7l-1.17.2.tar.gz')
md5sums=('1f52109bee0f071655dfb6d3aa6106f6')
sha1sums=('55b6b7f35f132cb32a9693c5bb39757aee4ccdbe')
sha256sums=('f9e38715bb48f24fb77a39cd04b43921e14f1a2402ef2657f60a0a289fb13258')
sha512sums=('3706a60c126a1b476569f013d3aee6b86649d42e45af1f953e193c36ac89c274fc7c614510497b767da4f6484a97e48b97f6d84bb209f4f5d73c39f653b2e9f5')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
