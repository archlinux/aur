# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Contributor: blainester <theblainestory@gmail.com>
# Contributor: nycko <email address unknown>
pkgname=micro
pkgver=1.3.0
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git")

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('939775c42251c6ba24c383f7c30940a85e29463f8df43c3d2b5228b1f9aa2d69')
sha256sums_i686=('02b1f1b30372e64a0ab5cb279ffa22de9427fc9d85aa2f19de0718a203086a57')

package(){
 install -Dm755 "${srcdir}/${pkgname}-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
