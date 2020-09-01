# Maintainer: fenuks

pkgname=otf-brygada1918
pkgver=1.0
pkgrel=2
pkgdesc="Digitalized version of Brygada font originally created to celebrate 10th anniversary of regaining independence"
arch=("any")
url="https://pl.wikipedia.org/wiki/Brygada_1918"
license=("Public Domain")
source=("https://niepodlegla.gov.pl/wp-content/uploads/2018/05/BRYGADA_1918.zip")
sha256sums=('198210296e2b9343c6c98fb4698f259a334600ef3031d64a81c89eeb465152df')


package() {
    cd "${srcdir}/BRYGADA_1918/"
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
