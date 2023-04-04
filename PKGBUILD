# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=4.3.0
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
b2sums=('7cf13fc8d39d28a72dc0519224feeb72f97c266c5b8b646db6d9f2cecd7fc43e1defce029a054a9f0b3119a199b5c1c778fb6a34c4a79e05119acdf742c5f124')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
