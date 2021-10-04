# Maintainer: Takumi <takuoh qt tutanota d0t com> # please replace q to a , 0 to o
pkgname=fonts-seto
pkgver=6.20
pkgrel=8
pkgdesc="handwriting Japanese font including JIS X 0213 kanji"
arch=(any)
url="https://setofont.osdn.jp/"
license=('OFL:1.1')
source=("http://ports.ubuntu.com/pool/universe/f/fonts-seto/fonts-seto_${pkgver}-${pkgrel}_all.deb")

sha256sums=('41316849ede6874adf1b60207f9d3fc25111953729c5c45ac84e9e4f76d5f53f')

prepare() {
        tar xvf data.tar.xz
}

package() {
        install -d $pkgdir/usr/share/fonts/TTF
        install -m644 ${srcdir}/usr/share/fonts/truetype/seto/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
