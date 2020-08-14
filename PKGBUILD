# Mantainer: nemesys <nemstart zoho com>

pkgname=fbsplash-theme-gen
pkgver=1.0
pkgrel=1
pkgdesc="fbsplash-theme-gen allows you to create fbsplash compatible themes automatically from any image file(s)."
arch=("x86_64")
url="http://sourceshark.com/sourcecode/tarballs/${pkgname}-${pkgver}.tar.gz"
depends=("imagemagick")
optdepends=("fbsplash: To set the fbsplash theme")
source=("$pkgname-$pkgver.tar.gz::http://sourceshark.com/sourcecode/tarballs/${pkgname}-${pkgver}.tar.gz")
options=(!strip)
sha512sums=('5691ebbfb24d2940b1f82cc11e56af3af295287a2b367e3057396d60673944ae22de9459ad56608ab72d323ba9d2e920a2d2cda0b692760a2d1133a581050368')
    noextract=("$pkgname-$pkgver.zip")

    prepare() {
        tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    }


package() {
    mv usr ${pkgdir}/
}
