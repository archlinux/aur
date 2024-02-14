# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.6
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

sha512sums_x86_64=('41aed766b17b6f65b32ade02685b61f9445a2f2e334f1d826275377bf6cc3d777f2bd1f6cc9a1a4a9bcd676a4811fc8ca4ee958cfdefcc1797062b8108e8af54')
sha512sums_i686=('64e9a32b1934cb9ebac7ff4390b8974957dc7ab8b9fd205a7399bb8b68058e7bf29e48cf874822f228d9d0bd3f652813224c26890313e001c6999df915c769f6')
sha512sums_aarch64=('09998fac4aed013a25ff7a733acfe6c80361921d4a6f2cfa0446ea0f66e708af79451dcf52c370d6abacab9af25786732e8d3e8c80754f9ee07fa71e3f3610eb')
sha512sums_armv7h=('b7593bcd13fb66b86d1f9937663e1139e63ce38fbfbcb6cf4e205ee5688de802a7bd6818c675024a897836fde9eb02374f79ce12c2b7f55ccc6a1fa7418410ed')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
