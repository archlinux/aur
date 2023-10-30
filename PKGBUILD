# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.7
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

sha512sums_x86_64=('b6b8f386fda09717f86d6a285765801156a23357b6ae2449d8b4660c9f55f29d99f11bb6d44a8bfc5cfed18456b9cb8858831447d4e966beae590dfd08de2dd7')
sha512sums_i686=('877f9d680a3d3ea7796ac681938a737e220df3f952dee429d75baf6e878aeeb99e54c84dfad7bb2a0c806684ecf9ce19a140a7c8c21b2d8fd88037cd9516e75f')
sha512sums_aarch64=('06802375ac27a682c23e443d5027f6e41a3ec5ad9e4ee162ac2c227de7df04552b60440c0a56f6b0356f3982f25965ed5604eba83a0f5adeeecd2290669274dd')
sha512sums_armv7h=('f7cc52c9890dd405d1a066a1f699e9618499c253a55248b37d83b1236bacfa1f9048643675998c3136bcfc53ade803ebe494265e0accba1f989b791dac10abb0')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
