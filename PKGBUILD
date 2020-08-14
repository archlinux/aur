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
sha512sums=('6bfb4156aeed0e7abee003996cebd1d80903669725050ad80e23136f1dad3e6aadb72dc14bc546fb42d8ad2357d2f3fda090459b0b8e267d03b303ae3a08e3aa')
    noextract=("$pkgname-$pkgver.zip")

    prepare() {
        tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    }


package() {
    mv usr ${pkgdir}/
}
