# Maintainer: Christian Pinedo <me (at) christianpinedo (dot) eu>
pkgname=ca-certificates-izenpe
pkgver=20210607
pkgrel=1
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
source=(
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/RAIZ2007_cert_sha256.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SSLEV_cert_signing_1_2018.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/CCEENR_cert_sha256.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/CCEER_cert_sha256.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/AAPPR_cert_sha256.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/AAPPNR_cert_sha256.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/TSA_timestamp_signing_4.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/IZENPE_ROOT_QC.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SUBCA_QC_CCEE.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SUBCA_QC_AP_0.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SUBCA_QC_TSA.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/IZENPE_ROOT_NQC.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/CCEENR_cert_signing_2020_0.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/SSLINT_cert_signing_0.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/APPDISP_cert_signing_0.crt"
    "https://www.izenpe.eus/contenidos/informacion/cas_izenpe/es_cas/adjuntos/TECNICA_cert_signing_2020_0.crt")
sha256sums=('2530cc8e98321502bad96f9b1fba1b099e2d299e0f4548bb914f363bc0d4531f'
            'db476339ccbfcc9e4bd1d6cb606ca27f00679e1ef8a581e7236309b9d63ffe37'
            '5a49b15ae60ff627da272a8743d67162baca1096168203213acf8227af4c4942'
            '7ed19361ad734d703fbadf029f52ec3b6648d8dd56baba0884ed4f859b5b9375'
            '25303cfd0bf1baa1ef248c29f073fffc2e7c81582ee23b45c7f1c3b32e341ad8'
            'cd6eb937ee17a9fcff60a790f8bde0ca9abca07b3ef46074dd1978f0bca4d449'
            'cd770a3ba5005bac3f6ef29e7fa4c7bea1ef41be52125356da0dd18f045c9219'
            '8e5b8baedc4d58be0e301cccb6ed173c08d7c77ce4350973389ff1afa11d7a65'
            '5c299d315949424138145e5ee1da677d934f095d8a5bf786c7abb8cb4fc6d65a'
            '1a4885ac77f5559b29bfae13c486ff093121fac268a8ecbb2bab303f5da942f9'
            'cf2058aac27925521fc7f2abacd2ee5429dd8d938debd3395ba4a6c042465da7'
            '1e50917787430f03cbf40447a0df24d739c24e4608a431622f8399308b0ae82b'
            'd6ed7778d33e4b138b3117a3e208a88ffe87038530295dc4cb504ec11ffdf69f'
            'cbe0af92f70d1af8c441b36dccd32ad2162a9e2e0e4fe3c8bd7aaa752c60ffe9'
            '22aeab1218b92e706d5a248f689500cedd06ce3fa0222929ef592c20f1ada9ab'
            'af702ad33f1da30b74a760350f5e7eff68096fdf41d2b573001e076a37700043')
noextract=()
validpgpkeys=()

package() {
    for file in *.crt; do
	install -Dm 644 "$file" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$file"
    done
}
