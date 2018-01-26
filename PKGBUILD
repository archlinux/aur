# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-git' 'micro' 'micro-nightly-bin')
provides=('micro')

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('f9abda227174e95f730fdf1158021ca016dfe960fa6484bd815983f4ffcbc2af')
sha256sums_i686=('a319ed152ba502d6c7425f0413bf84a85928b24ec02714f1dfb79347640298ab')

package(){
 install -Dm755 "${srcdir}/micro-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/micro-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
