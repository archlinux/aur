# Maintainer: nycko123 <nycko123 at gmail com>
# Previous Maintainer: Youngbin Han <sukso96100 at gmail com>
# Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git micro micro-nightly-bin")
provides=("micro")

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('4c55d43eb6f0277a07d075d29cdd468c7bc932b4864eacc673e141eba578b53c')
sha256sums_i686=('8e3cb24715fecf35a4e3e51fa0b083576d10e1483b3e651bde4d37831984e576')

package(){
 install -Dm755 "${srcdir}/micro-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/micro-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
