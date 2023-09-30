# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.0
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

sha512sums_x86_64=('f373fb838eafa607787795d7606adc375ef0c5731040d545376bf0aed82c9c68cc0c8c33f6572b1f23371be943ccc8c169e810f015293d91f0b2deb4f0f0fcfe')
sha512sums_i686=('b19a4173af27fbb7652b61b4ae892cd8072dc456fd50f24794ad6e2f1acf2c95c956eedf808e4ddbc218d72832d13322b237cf99448f97e8972a330a8092c981')
sha512sums_aarch64=('ba529886952692204a591416abff4395865c53a87576ec63aad50a6d9fab8fb2c3c9ae766a113568561d03581d209f052024630be1656dd35026ac168844864d')
sha512sums_armv7h=('0695d824625f2da6ffa37a8c1d76f413a95b4963def868e223dfc56233aa52d087143f9a21e78457b8dad6be44afb4f4dedaf6b82b9f31dbff45375114ecc082')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
