# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-soundtrack
pkgver=20.0302
pkgrel=2
pkgdesc="RVGL community-made sountrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("io_soundtrack.zip::https://distribute.re-volt.io/packs/io_soundtrack.zip")
sha256sums=('d51e52d23d74d26aa93d8b96035d153ccf8e69f6bc93db7e3b615de060155010')

package() {
    find redbook music -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
