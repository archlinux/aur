# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.3
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('8d80b3d588970ffdf1bb1fa87ac05a35d67c15934f34764599e6f6b78bd6697b8481436af43cf011114811d0d8d778b33f7c7234795dfcb6d1368ae09714ee0f')
sha512sums_i686=('f7b6757b10938d13e1e158d36d6dd34ce7771ce0833e3c2e5b557191adae2a9e8a5a7504e88efec9b8cc854b345f23e1a475301f1bd34a2132315fdbdd0ad764')
sha512sums_aarch64=('0e2af5a96e2376629ba08bdd012ba056a75364e8d4dfd6fc2e4f5cedde4b514b02f67bf9cb5de5c6e1159369cc5ebd9b61d419086a3c12de60e02f3936621f41')
sha512sums_armv7h=('932caf79bd836fd155a99a75cb7d6735c2cff51afa9ce36b40924f99741a3015cb0905e3bec2f01cdc352eea705c24c804bf1723055517bd961663b5cc344a18')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
