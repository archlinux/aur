# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=onscripter-yuri-bin
pkgver=0.7.5beta5
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
sha256sums_x86_64=('6f4a6487f8315fe669362b531a73bc6a098f7694e4e77d2cc38519c719ff8706')
sha256sums_aarch64=('613d6b998cbeff57d8de945f6c5ea078577c4871ba60730112e662c152f73cb3')
sha256sums_i686=('2bca3912e6dae53aed1432a61716fe2b1e291a6a1a858816cd7cacc856fca144')
sha256sums_armv7h=('c52e975ea68363958b6ff7f3c0cd3743e3e6b2f8d7aad19c71f24f5308b58bec')

package() {
	find . -name "onsyuri*" -exec install -Dm755 {} $pkgdir/usr/bin/onsyuri \;
}
