# Maintainer: DisLogicator <supasecrethacker@gmail.com>
# PKGBUILD make by Jhyub

pkgname='hoffice'
pkgver=11.20.0.1520
pkgrel=1
pkgdesc="한글, 한셀, 한쇼 뿐만 아니라 MS 워드, 파워포인트 ,
엑셀 문서를 편집할 수 있는 한컴오피스 통합 편집기입니다."
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hoffice')
depends=('harfbuzz-icu')
source=("https://github.com/DisLogicator/hoffice/releases/download/11.20.0.1520/hoffice-11.20.0.1520.tar.gz")
sha256sums=('6c2957b32305eaf98ab3069268d8431fc96aff095101a2360a396e99ef6295b6')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}"/*.desktop
    mkdir ~/hnc
    install -Dm644 -t "${pkgdir}~/hnc" "${srcdir}"/*.png
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/opt/hnc"
    bsdtar -xf hoffice11.zip -C "${pkgdir}/opt/hnc"


}
