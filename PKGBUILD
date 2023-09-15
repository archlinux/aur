# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.3.0
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

sha512sums_x86_64=('34ffd7e2e2cd8dc02ab54360206c324343cf32da10f0ef603c5672745d00b9b73f034460b49f71fe8298d4cfd0b10d16ee8217fc33c5e7e9e0afb19c3952f822')
sha512sums_i686=('e1b3a34ef96fe9b83bce9b82159bcc510a3841c56e3dcc058b866751a4409b0e16e6d8bdef8129fb814945497c1b6c833e302db0d3bb37d266bf2d1155c70945')
sha512sums_aarch64=('a733da41f8dd794600274a92612397348674789ac9967ed88aef3e2cf97159bf2f7d7a109c089e966996c4f98696dd70c276ab5fa59ba158803a668f79e6f483')
sha512sums_armv7h=('53a277bc8ca354e453a286e0eacc31abf932ca8288925685bb631adccd69d8203403bdabfae47c88a209476a8791434ba6585792a123eadd1a8ee42f20b673d9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
