# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=4.1.0
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
b2sums=('8c9ae304ff17105d561d76321b1aa743ad2390e152222a85c90f6de9c20c1205b8e93e53488a4da6c81a142427024c3bc115b410e8d423320c0950b802898d71')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
