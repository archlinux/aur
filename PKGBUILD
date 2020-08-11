pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool"
pkgver="0.9.3"
pkgrel="2"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("dotnet-runtime")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool.zip")
sha256sums=("bc0c66ac7a44e892de16597b300a9933f195b4822230cf9658ea29a44f963046")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    #install -Dm755 ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    cp -r ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}
