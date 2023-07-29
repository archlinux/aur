# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=onscripter-yuri-bin
pkgver=0.7.4
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
sha256sums_x86_64=('4130730a93d00f06e54c31d7494f8d319d92ff26713be84adce0cdc28e65f79a')
sha256sums_aarch64=('51b3881446b2a8f5e8e138bc00426c2a89a7f12ce6042b38c85085582dfcd153')
sha256sums_i686=('7f236181e40d439e45b9ce04bb8020ca134178c4e11310cf7f9dfc5fab9805f6')
sha256sums_armv7h=('3a5382eec70601107e9ff3aae32c0235fe74951df19514bf42336c1c10d6df1a')

package() {
	find . -name "onsyuri*" -exec install -Dm755 {} $pkgdir/usr/bin/onsyuri \;
}
