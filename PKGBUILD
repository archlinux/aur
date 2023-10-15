# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.4
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

sha512sums_x86_64=('18cab2b4ad6743f36375504744de56fd3ba8e9ce8ec54bef95d40d084e3e7dba38cce07cc88dfdca36e5081dcd8450078522264123efcf5b77e5b9d9f4aff459')
sha512sums_i686=('d52cb7f0d9b4d10aa15a2c6d0375ba19bf3beee1eaa45a7d58b715d9994d403c592bee83b545e1093ad63d915ab4bebaaa3164e74e72bfc37488599619f3dc57')
sha512sums_aarch64=('5553862ced995dc10aa4a2a05d4fb42d23e0d8d1333229862f26be3b4fd2e348949e4e684742c4cd9444bf685851f55bc4ab99ac878ffb09af4bb63c75211f13')
sha512sums_armv7h=('9c2524ac3ce934ad757f7e0072a80dd35087305ddc7b9372f4d6e2ed43e6106af2f48b8c8d9b965e1b5c33913d7838c80c130a8f3c384329935c1d190d777ac6')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
