# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kstogram
pkgver=1.9.2.930
pkgrel=2
pkgdesc="Download and backup Instagram photos shared by any user."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-stogram"
license=('custom:eula')
depends=('qt5-quickcontrols' 'libexif')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('7970c1f1aacd5a546ca8252c2d48a874478a26e23eb57769f54c5feac7316f51'
            'b1add61c84f745911dee0672b25e021a3da0d90127843f3a814864858306ab8b')
sha256sums_i686=('bec8252866dc0e20aa8f8d19090ba38e6b55c0c58fa4e3f2caf71a79573e5d1f')
sha256sums_x86_64=('2c68da220b9755c328297bb4b5dfdf54b75f7e60dc6ddadfd5447e5576d60d20')

package() {
  install -m 755 -D "${srcdir}/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${srcdir}/${pkgname}/doc/eula" "${pkgdir}/usr/share/licenses/${pkgname}/eula" 
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
