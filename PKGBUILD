# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.6
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

sha512sums_x86_64=('43ce7dd6bdf66d49b00129747115dec7dd1a85281503e77027de2379d5f319e1c740d43233ffd1356f3f60fdc9059761b9329ebc9de4e3cefef676ecd3d84310')
sha512sums_i686=('08599e3408df7b812ea6c27a14d8dbf473dbf43c59c3eff9df03468b97a136bec0ba4b5407fdec02b24b8e79b0d8e0f9077b2fef1e13855bc6561524fe5fae50')
sha512sums_aarch64=('65675b142cbb087365d5cd54d7ecc70c5d0bd245822ad2d47f8dee4a7d4361071683fac67e375d113fbec143a312dcd19decacece48fd67bf1d312d540055b22')
sha512sums_armv7h=('7936d80ea36510d6f2722db3c884ee43f85ac48f8a7170876ff65b70011ed5287d9880d6952d03144b1e3068c06a245353e561f6e6bfe3a0b5f08f80ca0af840')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
