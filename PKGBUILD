# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-autotype
pkgver=0.4
pkgrel=1
pkgdesc="Autotype passwords from pass using dmenu"
arch=('any')
usl='https://github.com/B3RR10/pass-autotype'
license=('MIT')
depends=('dmenu' 'pass')
optdepends=('ydotool' 'xdotool')
source=('https://github.com/B3RR10/pass-autotype/releases/download/0.4/pass-autotype')

package() {
    install -Dm755 pass-autotype ${pkgdir}/usr/bin/pass-autotype
}
md5sums=('08601fceed811597ecaaa65a369029ce')
sha256sums=('3947daf801542c5140e0c3b45e7ac1f37589c0867593909c75c5c65a359087cf')
