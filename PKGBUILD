pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool-linux"
pkgver="0.9.5"
pkgrel="1"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
options=('staticlibs')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("dotnet-runtime")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool-linux-${pkgver}.zip")
sha256sums=("a057ea662f707a9fce60cbab1bf6b209cf9fb29d331c9785c1573a213adb5da0")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    cp -r ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}


