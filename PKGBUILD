# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-autotype
pkgver=0.2
pkgrel=1
pkgdesc="Autotype passwords from pass using dmenu"
arch=('any')
usl='https://github.com/B3RR10/pass-autotype'
license=('MIT')
depends=('dmenu' 'pass')
optdepends=('ydotool' 'xdotool')
source=('https://raw.githubusercontent.com/B3RR10/pass-autotype/v0.2/pass-autotype')

package() {
    install -Dm755 pass-autotype ${pkgdir}/usr/bin/pass-autotype
}
md5sums=('487ba886f7750e34409bd5c3cc6a37d1')
sha256sums=('595935c15148fbf4f9dc2b70f79e31be620b0d915d0632f617fa4d20adc3b42d')
