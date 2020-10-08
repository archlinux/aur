# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-bin-armv7l
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-bin-armv7l-1.17.2.tar.gz')
md5sums=('290fe0cfb9b1bf20403409dcf9e34be4')
sha1sums=('2b79205a99d88cd1fdced8921c7f669ea7177914')
sha256sums=('c6205e155987e795534d91ab59edbd5a3ea3960f6a54d1489aa3c043c69070d1')
sha512sums=('752de93fc5cc9dc28679bcc2ed3c9c96b303e76776223a767fb441b9c1a2ab567d6b1ba1a3f2fe43d3dda7b8d7bd4151c78962215b820d75e0c4a03f55034cd8')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
