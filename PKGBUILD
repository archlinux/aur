# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-autotype
pkgver=0.5
pkgrel=1
pkgdesc="Autotype passwords from pass using fuzzel and wtype"
arch=('any')
usl='https://github.com/B3RR10/pass-autotype'
license=('MIT')
depends=('fuzzel' 'wtype')
source=('https://github.com/B3RR10/pass-autotype/releases/download/v0.5/pass-autotype')

package() {
    install -Dm755 pass-autotype ${pkgdir}/usr/bin/pass-autotype
}
md5sums=('26f22c742d97e723c24b3fd7e13fa8e5')
sha256sums=('b333c80adb239f773fd43627e219512d16da30338e75fceec74653ea8aea9359')
