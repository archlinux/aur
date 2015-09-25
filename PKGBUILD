# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=retdec-sh
pkgver=0.1
pkgrel=1
pkgdesc="Shell scripts for decompiling and analyzing binary files through the retdec.com decompilation service by using their public REST API"
arch=('any')
url="https://github.com/s3rvac/retdec-sh"
license=('MIT')
depends=('curl')
source=("https://github.com/s3rvac/retdec-sh/archive/${pkgver}.tar.gz")
sha512sums=('ef6a633e698f8b63a29fd40a8815b418425f31ba78e76fe4c477cd781172845fab289e0805a06b0364ae1b2cb468c8388a02324da41ae8d9ceac4db1119fe6d9')

package() {
    cd "${srcdir}/retdec-sh-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "scripts/decompile.sh" "${pkgdir}/usr/bin/decompile"
    install -Dm755 "scripts/fileinfo.sh" "${pkgdir}/usr/bin/fileinfo"
}
