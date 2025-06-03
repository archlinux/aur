# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=onscripter-yuri-bin
pkgver=0.7.5beta3
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
sha256sums_x86_64=('43b074a43f1fe3c95153bc73106614d825e404e156e7bc267228ca7d12a014e7')
sha256sums_aarch64=('9fefde7d450f520f7364c0b1c1a15a97934eac79f187e2d8ea29d362668847dd')
sha256sums_i686=('b793a975610461114229da2d43d74f56885bba36ef2a9d3824faa831fc7dfbbd')
sha256sums_armv7h=('fbb6330354c422ffba4133f125d1802021e98c61d5f27ab092d89c2ff02ff184')

package() {
	find . -name "onsyuri*" -exec install -Dm755 {} $pkgdir/usr/bin/onsyuri \;
}
