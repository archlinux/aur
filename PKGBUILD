# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=5.0.0
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
b2sums=('f5d11fab9643b37821466a2ded62a306e2a9de92ca7fa915b5cbc97ced181cdcf795b416aa22950f14ff8a17a43d6caf375d75799ad64f0b9f3e62e7357ef948')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
