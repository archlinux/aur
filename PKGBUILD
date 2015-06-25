# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>
# Maintainer: Alexandru Ianu <alexandru.ianu@gmail.com>
pkgname=glc-scripts
pkgver=1
pkgrel=1
pkgdesc="GLC OpenGL capture scripts - mp4 conversion (glccnv), 30/60 fps Alsa/Pulse capture (glcr30/glcr60/glcr30p/glcr60p)"
arch=("any")
url="https://wiki.archlinux.org/index.php/GLC"
license=('GPL2')
source=("https://www.dropbox.com/s/ldmqgk2945vo2ep/glc-scripts.tar.xz")
md5sums=('090d2bfe1c668563cd6cbf8904854fed')
depends=('glc' 'ffmpeg')
optdepends=('glc-pulseaudio-git')
package(){
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/glccnv" "$pkgdir/usr/bin/glccnv"
	cp "$srcdir/glcr30" "$pkgdir/usr/bin/glcr30"
	cp "$srcdir/glcr60" "$pkgdir/usr/bin/glcr60"
	cp "$srcdir/glcr30p" "$pkgdir/usr/bin/glcr30p"
	cp "$srcdir/glcr60p" "$pkgdir/usr/bin/glcr60p"

}