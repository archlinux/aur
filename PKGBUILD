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

sha512sums_x86_64=('17cc2c23676469251e779bd6c2730a76f753e50998bd50ea328cfccece5b3a0227a4f63a540bbbc831dd771c5483f673093d27400ff6ea08e1725a2db369cf02')
sha512sums_i686=('23d7968a4e0cffeeda5f04557150084755dc0b1e66557b6680d6bf69d523995084c9110a19fcc42b3621e1928ddbe5d413032b7e048eaafa02af677682c50f93')
sha512sums_aarch64=('5d739d5ec07b003eb65c939b0434d04d10cca8bbfa74bd166758d4b1c26a229a691d0da15d8e7a1e76f70b4ee17296376142af0daba6fecdebf70cb12cc42225')
sha512sums_armv7h=('5e2ddf71fa35704617cc8f5d5b60f09395b79ba525a84637226486548a088fb2a423b44e92a0cd1d6905bd1ff2ef1bd7dcaf57b0a9bc08ec31e1346d07fcf932')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
