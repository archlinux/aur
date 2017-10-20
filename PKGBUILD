# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# Previous Maintainer: Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-git' 'micro' 'micro-nightly-bin')
provides=('micro')

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('329f746e4ee9edf244618dda4208b638fda34c593d5cd96d8f71dc3b53e3d994')
sha256sums_i686=('7600666ae08a878c40efa2448fce03a042a18132a2a7f27e134502d36065193d')

package(){
 install -Dm755 "${srcdir}/micro-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/micro-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
