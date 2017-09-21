# Maintainer: Adrien 'Litarvan' Navratil <adrien1975@live.fr>
pkgname=lightdm-webkit-theme-litarvan
pkgver=2.0.3
pkgrel=1
pkgdesc="Modern and full-featured LightDM theme"
arch=('any')
url="https://github.com/Litarvan/$pkgname"
license=('BSD')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/Litarvan/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('99e5b254d719642fc40be2c6f8084787')

package() {
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/litarvan"
  cp -r "$srcdir/"* "$pkgdir/usr/share/lightdm-webkit/themes/litarvan/"
}
