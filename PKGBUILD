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
md5sums=('9d2d2f4080692cec77e407193e842041')
sha1sums=('9af7cc5da7f6406ab3d1e260048b78e56bf9415c')
sha256sums=('0a3fab59dca61af5105d58929dbe621023a4e363dde49fcce4bf44412c0f05ce')
sha512sums=('fa058283ef1db2175eaca0e8cc92083e99441f19c8622121352ccd6ac7c9e74fd3ce8d1a16a0a3bf2949df522d046df174bc8ae9afef0a533652f93d4e583bbf')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
