# Package from: cytopia <https://github.com/cytopia>
# Maintainer: LLL2yu <lll2yu@protonmail.com>
 
pkgname="ffscreencast"
pkgver=0.6.4
pkgrel=2
pkgdesc="ffmpeg screencast/desktop-recording with video overlay and multi monitor support "
arch=('x86_64' 'i686')
url="https://github.com/cytopia/ffscreencast" 
license=("MIT")
depends=('bash' 'ffmpeg' 'v4l-utils' 'alsa-utils' 'xorg-xdpyinfo')
makedepends=('git')
provides=('ffscreencast')
source=("git+https://github.com/cytopia/ffscreencast.git")
md5sums=('SKIP')
package() {
     mkdir -p "$pkgdir"/usr/bin 
     mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
     cp "$srcdir"/"$pkgname"/bin/"$pkgname" "$pkgdir"/usr/bin
     cp -r "$srcdir"/"$pkgname"/config "$pkgdir"/usr/share/doc/"$pkgname"
     chmod +x "$pkgdir"/usr/bin/"$pkgname"
}
