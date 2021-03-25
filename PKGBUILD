# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=tamarin-bin
_build=710
pkgver=1.4_$_build
pkgrel=1
pkgdesc="The ActionScript virtual machine"
arch=('i686' 'x86_64')
url="https://developer.mozilla.org/en-US/docs/Archive/Mozilla/Tamarin"
license=('GPL' 'LGPL' 'MPL')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib')
provides=('avmshell')
conflicts=('tamarin')
source=("https://ftp.mozilla.org/pub/js/tamarin/builds/tamarin-central/$_build/linux/avmshell")
sha512sums=('da08819b5b29cda70e9e602e33be95da8e6f1eb585d0bcb229dc89c8f036bb905a5ca8deeb9123d2465d7dd2ae624b01dbb4669f44a1ebeb40b406d9eca6e46c')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/avmshell"
}
