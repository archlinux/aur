# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=onscripter-yuri-bin
pkgver=0.7.5beta2
pkgrel=1
pkgdesc="An enhancement ONScripter project porting to many platforms, especially web."
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/YuriSizuku/OnscripterYuri"
license=('GPL2')
depends=(glibc)
provides=(onsyuri)
conflicts=(onscripter-yuri)
source_x86_64=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_x64_linux")
source_i686=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_x86_linux")
source_armv7h=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_arm32_linux")
source_aarch64=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_arm64_linux")
sha256sums_x86_64=('17c454a9f1f2d3002a80498726be45f36475be6e5e60b355096d990a91324aaa')
sha256sums_aarch64=('0e68bbcae56906ccbdeb967b1f60b4a13cca3769168d1695d1d91d00df5e425b')
sha256sums_i686=('b4137e4ef7d5f3c30f2b0bdfb96739fca496c4daf35d87c33303905d720da4cb')
sha256sums_armv7h=('d6da34066dda1b846b468a25412845208f6b9e60834b1f7a56ce401dcbfc1944')

package() {
	find . -name "onsyuri*" -exec install -Dm755 {} $pkgdir/usr/bin/onsyuri \;
}
