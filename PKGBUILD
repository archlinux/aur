# Maintainer: Sudhip Nashi <sudhip at nashi dot us>
pkgname=spotify-bin
pkgver=1.1.26.501.gbe11e53b
pkgrel=1
pkgdesc="Spotify client - listen to your music anywhere anytime"
arch=('any')
url="https://www.spotify.com/us/download/linux/"
license=('custom')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'cairo' 
	'desktop-file-utils' 'fontconfig' 'freetype2' 
	'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 
	'glibc' 'gtk2' 'curl' 'libx11' 'libxss' 
	'libxtst' 'openssl' 'pango' 'syslog-ng' 
	'xdg-utils' 'zlib' 'hicolor-icon-theme')
optdepends=('ffmpeg: extra audio and video codecs')
source=("https://www.dropbox.com/s/tp5blzfx0sxbwex/sources.tar.zst?dl=1")
sha1sums=('9cdfe1ee1969c10c130695f90814331e273eee61')
install="$pkgname".install

package() {
	echo "This software is not owned or operated by me. I am not affiliated with Spotify (AB) in any way, shape, or form."
	sleep 4s 
	ar -xvf "$srcdir"/spotify-client_1.1.26.501.gbe11e53b-15_amd64.deb
	tar -xvf "$srcdir"/data.tar.gz -C "$pkgdir"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
