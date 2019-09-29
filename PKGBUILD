# Maintainer: Sarah A. <(replace z with a)serz @ mzdotsuki dot net>

pkgname=pcf-spectrum-berry
pkgver=1.0.0
pkgrel=1
pkgdesc="A small monospaced bitmap PCF font made by Spectrum"
arch=(any)
url="https://github.com/seraxis/pcf-spectrum-berry"
license=(unknown)
source=('https://github.com/seraxis/pcf-spectrum-berry/releases/download/v1.0.0/berry.pcf')
sha256sums=('fe4fff95db99012b160c9746078633a60cb39ce3c0aae061a719b00ee3183eb2')

package() {
    install -d "$pkgdir/usr/share/fonts/misc"
    install -m644 *.pcf "$pkgdir/usr/share/fonts/misc/" 
}
