# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-x86_64
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-x86_64-1.17.2.tar.gz')
md5sums=('a71b4493556266d94db5c97257728f64')
sha1sums=('986be884bdb4127c9440a358fc219248325b2949')
sha256sums=('bcc14d3fd04269cc27e5d860060c6cb0211af6db53e827efce8a852d81cd735e')
sha512sums=('d713ef6e1afb9f9ecd5f69be7d172bb6d83d886c76552ec9b2daab9c1f9fa7a6ed8fe713ba5f5a400b318d12b52de829f5bf09fa7d621cd759dfdfedd99391f1')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
