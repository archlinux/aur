# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=ca-certificates-izenpe
pkgver=20171213
pkgrel=2
epoch=
pkgdesc="Izenpe CA certificates"
arch=('any')
url="http://www.izenpe.eus"
license=('unknown')
groups=()
depends=('ca-certificates-utils')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/RAIZ2007_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/CCEER_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/CCEENR_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/AAPPNR_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/AAPPR_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SSLEV_cert_sha256.crt"
	"https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/AAPPR2_cert_sha256.crt")
sha256sums=('2530cc8e98321502bad96f9b1fba1b099e2d299e0f4548bb914f363bc0d4531f'
            '7ed19361ad734d703fbadf029f52ec3b6648d8dd56baba0884ed4f859b5b9375'
            '5a49b15ae60ff627da272a8743d67162baca1096168203213acf8227af4c4942'
            'cd6eb937ee17a9fcff60a790f8bde0ca9abca07b3ef46074dd1978f0bca4d449'
            '25303cfd0bf1baa1ef248c29f073fffc2e7c81582ee23b45c7f1c3b32e341ad8'
            'b08c196a2ed1e84f9892db1b61219ceb642882478f39b08719603d0735fa03d1'
            'faeec9860a3c472b589a301393fc3c314f6792d31351a78ad3b80639dc2b235c')
noextract=()
validpgpkeys=()

package() {
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/AAPPNR_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/AAPPNR_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/AAPPR2_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/AAPPR2_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/AAPPR_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/AAPPR_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/CCEENR_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/CCEENR_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/CCEER_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/CCEER_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/RAIZ2007_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/RAIZ2007_cert_sha256.crt"
    install -Dm644 "$srcdir/usr/share/izenpe-certificates/SSLEV_cert_sha256.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/SSLEV_cert_sha256.crt"
}
