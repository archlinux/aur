# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.8
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

sha512sums_x86_64=('a816429bef924de87d561d0944c3d7ff3fc1e3a7606f66b4217ed941d7a284839bf541e68a4a58bf294d50e3a1b84e493fef7516dc83706ec48825bdf3c4c7d7')
sha512sums_i686=('2c8a9608bcf0cc6d28c7055b66a543980ba9649a691c912b6032cc8845a79682edb331056dac8176bed1ee196e9fea531f314b76a28c7408e83cafb6327d9ab6')
sha512sums_aarch64=('7a563d7e7a2727f8dba464215e3c078e322cac26465b2ab37be7bb916daffe76f05cdf4987a480351027c9ce4c493208e1594599b19a03a7994db2351d46529e')
sha512sums_armv7h=('2dfa9f44527e1f6be041832dec6d67c33f14a17f8bdf0a6e18bf44a3b062d08e588c5b33b91acc732e3c0c58ebe32bc7fc2140f2155590cdbdcf47abc97196de')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
