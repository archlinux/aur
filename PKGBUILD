# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=6.0.0
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('openssl' 'alsa-lib' 'gcc-libs')
provides=('aspeak')
conflicts=('aspeak')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-$CARCH-unknown-linux-gnu.tar.gz")
noextract=()
b2sums=('dbae27d025d5b3c2aa97c9359f77e989eff21dd88225da594da940a4b70273f8425941267692ac971299e33b92d142bf509b6fabf5e4e2de04b696fd979fa7c1')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
