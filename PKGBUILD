## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=kim-frameworks
pkgver=0.9.5
pkgrel=2
pkgdesc="Plasma 5 Image Menu to compress, resize, convert, rotate and webexport"
arch=('x86_64')
url=("http://www.audio-linux.com")
license=('GPL')
depends=('bash' 'imagemagick' 'dolphin-git' 'kdialog-frameworks-git')
source=("http://www.tophifi.it/ftp/packages/$pkgname.tar.gz")
sha256sums=('415cf12ac7c1f21aecd2142ad65f409d68fafd747c14d2b8d09c74a76b4e7075')

package() {
 tar -xf $pkgname.tar.gz -C "$srcdir"
     install -Dm755 "$srcdir/kim/kim_compress" "$pkgdir/usr/bin/kim_compress"
     install -Dm755 "$srcdir/kim/kim_compress" "$pkgdir/usr/bin/kim_compress"
     install -Dm755 "$srcdir/kim/kim_convert" "$pkgdir/usr/bin/kim_convert"
     install -Dm755 "$srcdir/kim/kim_resize" "$pkgdir/usr/bin/kim_resize"
     install -Dm755 "$srcdir/kim/kim_rotate" "$pkgdir/usr/bin/kim_rotate"
     install -Dm755 "$srcdir/kim/kim_webexport" "$pkgdir/usr/bin/kim_webexport"

     install -Dm644 "$srcdir/kim/kim_compressandresize.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/kim_compressandresize.desktop"
     install -Dm644 "$srcdir/kim/kim_convertandrotate.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/kim_convertandrotate.desktop"
}