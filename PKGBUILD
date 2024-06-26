# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.4
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

sha512sums_x86_64=('3762d27f4c2d78543e3de43c94b1913ac7f0f759d6957120670743867b9ee9cd23dda5b7e5656763851bc8dc4354deb9591dec130fe113d391334e3aa3a56f25')
sha512sums_i686=('e234b36c5e4cf3d9f0d5ca1f3530f29c082f186f43b16878748c9708bd8d8d4a026705f668e71d748bdd7d334bdca1f66b959a9443182501af9eacc8a09b0d98')
sha512sums_aarch64=('a549f938151a4f445a5c8380a22582ce434656f3d56fceb4425a2a69416f2c9870bfc04f45722045a6b62d57b5e832ef22f32a7166342ebfe477402fbf0d372e')
sha512sums_armv7h=('3d55ccf16a711a9bf834ae3f2b775958fc33b3cbec727a03635cd438ff6b5aa83ea5ed041ab0fb78cff3dd18687d48bbc43fa368786c9db9fe01e0ddef29ed3b')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
