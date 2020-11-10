# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-autotype
pkgver=0.3
pkgrel=1
pkgdesc="Autotype passwords from pass using dmenu"
arch=('any')
usl='https://github.com/B3RR10/pass-autotype'
license=('MIT')
depends=('dmenu' 'pass')
optdepends=('ydotool' 'xdotool')
source=('https://raw.githubusercontent.com/B3RR10/pass-autotype/v0.3/pass-autotype')

package() {
    install -Dm755 pass-autotype ${pkgdir}/usr/bin/pass-autotype
}
md5sums=('e9dd0b6031a88a24bba682daa09e11f8')
sha256sums=('7fce1e102d9a0b604aa24656a4212687b9d1cf15737c8032d72669c28e89835b')
