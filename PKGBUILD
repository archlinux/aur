# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=4.2.0
pkgrel=2
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
b2sums=('618f8b470ee2e38272be8bcdf89b809bd8a05a203189dff146ac0cdaf6feaf36902faa48c8d6f852e93df52fb25233968f02dcc10ed83d4cef42003b852f5fa0')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
