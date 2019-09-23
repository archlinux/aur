# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-soundtrack
pkgver=19.0825
pkgrel=1
pkgdesc="RVGL community-made sountrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/soundtrack.zip")
sha256sums=('ffa30c38f7259e967b2a42d76916d3047b00ccb6c227343e5ea3724fa50798fd')

package() {
    find redbook music -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
