# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=onscripter-yuri-bin
pkgver=0.7.6beta1
pkgrel=1
pkgdesc="An enhancement ONScripter project porting to many platforms, especially web."
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/YuriSizuku/OnscripterYuri"
license=('GPL-2.0-only')
depends=(glibc)
provides=(onsyuri)
conflicts=(onscripter-yuri)
source_x86_64=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_x64_linux")
source_i686=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_x86_linux")
source_armv7h=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_arm32_linux")
source_aarch64=("https://github.com/YuriSizuku/OnscripterYuri/releases/download/v${pkgver}/onsyuri_v${pkgver}_arm64_linux")
sha256sums_x86_64=('73182210b06a67b8388c6f206f6eb90123e5c81763ca4466c9f44f6dc36893fd')
sha256sums_aarch64=('20e86be256ae4f3d81282bda714f0a4686f36fd02575f48782a0008c7afb6f67')
sha256sums_i686=('ab618e4c3d969d884de745746d42d23aacb04d9f9643840b519fd74fd7f44116')
sha256sums_armv7h=('21995a15f70ae92cd2b13a4d54b8cdb1023a21e24a4c1da5566e8ea548df8357')

package() {
	find . -name "onsyuri*" -exec install -Dm755 {} $pkgdir/usr/bin/onsyuri \;
}
