# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-autotype
pkgver=0.1
pkgrel=1
pkgdesc="Autotype passwords from pass using dmenu"
arch=('any')
usl='https://github.com/B3RR10/pass-autotype'
license=('MIT')
depends=('dmenu' 'pass' 'ydotool')
source=('https://raw.githubusercontent.com/B3RR10/pass-autotype/v0.1/pass-autotype')

package() {
    install -Dm755 pass-autotype ${pkgdir}/usr/bin/pass-autotype
}
md5sums=('ada04f9c6912b9e7c17ce23be574da75')
