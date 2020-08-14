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
sha512sums=('0976ca76ad4597edaf36fdc0d663485ac76e4baf653b25b0b2102988985521f10676d60723f4d79b80b7e7a6944204349d787b8bef6bd6a2a9b37a65ba5caa99')
    noextract=("$pkgname-$pkgver.zip")

    prepare() {
        tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    }


package() {
    mv usr ${pkgdir}/
}
