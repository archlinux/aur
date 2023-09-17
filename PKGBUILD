# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.4.2
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

sha512sums_x86_64=('93fa55d08567ca9e5598a308486bbf2704f1d4af9977ad20dc5d37430af8b6fe275e7757dda2481451a3dd1e0bc3321b6780e80d13edac31ec84e6fb94e7f782')
sha512sums_i686=('fca1366dfc9cd18712c20fa9c1d6bde67293ae676ca10a35760d2112f93c5a8efd761b6b1aa4fd4ea12e80f2c14187043bc2fc3c031fff2b8b66bfa849657b21')
sha512sums_aarch64=('06004a6ef87feb7846c2beccb889f62087bbd3bcb18003430f6e374b611fabb25660f8f45936f3ad0a6002129aa934ac9435da6d13b8f3aabf4a651002160aaf')
sha512sums_armv7h=('da06c1fbce677ebff41b99f8a689c5910d4750e061a0bf0f8e981f8524c736aa2dfa6c02610ff5a9e8f2227ba939299311b79029e1e7a9b1712e3b6b52027d67')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
