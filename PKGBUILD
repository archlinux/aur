# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Contributor: blainester <theblainestory@gmail.com>
pkgname=micro
pkgver=1.1.1
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git")

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('6a6a6840507068619eccc03f1a04f3164e0ac5309c8b4928dd893c0aa3e7e604')
sha256sums_i686=('747e6a718f0d5d3f0f83f820163bcd5ab17787ed42b67aae05f22c6672a40865')

package(){
 install -Dm755 "${srcdir}/${pkgname}-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
