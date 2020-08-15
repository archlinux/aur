# Mantainer: nemesys <nemstart zoho com>

pkgname=fbsplash-theme-gen
pkgver=1.0
pkgrel=2
pkgdesc="fbsplash-theme-gen allows you to create fbsplash compatible themes automatically from any image file(s)."
arch=("x86_64")
url="http://sourceshark.com/sourcecode/tarballs/${pkgname}-${pkgver}.tar.gz"
depends=("imagemagick")
optdepends=("fbsplash: To set the fbsplash theme")
source=("$pkgname-$pkgver.tar.gz::http://sourceshark.com/sourcecode/tarballs/${pkgname}-${pkgver}.tar.gz")
options=(!strip)
sha512sums=('65803e63c2758fa31fc141dec2674baa0e5c21e1ebe87e7a375fcec33113b12eeea2fb90820c50439a1dd0f8d05a77bfcfba3746231213fa5d77f1450516f0fd')
    noextract=("$pkgname-$pkgver.zip")

    prepare() {
        tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    }


package() {
    mv usr ${pkgdir}/
}
