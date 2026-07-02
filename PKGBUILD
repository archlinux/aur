# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=numnum-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A text editor that does math - units, currencies and percentages in plain language"
arch=('x86_64')
url="https://github.com/rudrabhoj/numnum"
license=('GPL-2.0-only')
depends=('libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'gcc-libs')
options=('!strip' '!lto' '!debug')
provides=('numnum')
conflicts=('numnum')

source=("https://github.com/rudrabhoj/numnum/releases/download/v${pkgver}/NumNum-${pkgver}-archlinux-x86_64.pkg.tar.zst")
sha256sums=('85f90f4501d477813be24cd5a61e79a03101a6af80325b07226fcd10816d9749')

package() {
    bsdtar -xf "${srcdir}/NumNum-${pkgver}-archlinux-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO'
}
