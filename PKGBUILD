pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool"
pkgver="0.9.2"
pkgrel="1"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("mono")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool.zip")
sha256sums=("9f25c300ff3d9854eac87b9d012a3fb14b8a4ee9a2d1c55116a98f0158ff3d90")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    install -Dm755 ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}
