# Maintainer: Foppe Hemminga <foppe@foppe.org>

pkgname=otf-cooper-hewitt
pkgver=1.0
pkgrel=1
pkgdesc="Cooper Hewitt font"
url="http://www.cooperhewitt.org/colophon/cooper-hewitt-the-typeface-by-chester-jenkins/"
arch=(any)
license=('custom')
depends=(fontconfig xorg-font-utils)
source=("http://uh8yh30l48rpize52xh0q1o6i.wpengine.netdna-cdn.com/wp-content/uploads/fonts/CooperHewitt-OTF-public.zip"
"LICENSE::https://raw.githubusercontent.com/cooperhewitt/cooperhewitt-typeface/master/files/-OFL-FAQ.txt"
"otf-cooper-hewitt.install")
md5sums=("cbff2bac99d77efd80f9b17689bcfc8c"
		"ecad149092c844fd28c1b727871748b6"
		"da4ec4807849dfb5ad3aa5896912cfe6")
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 "$srcdir/CooperHewitt-OTF-public/"*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "${srcdir}/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}