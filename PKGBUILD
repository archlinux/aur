# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.0
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

sha512sums_x86_64=('68da8ed49d160c574fda41309a33e23499461d8a7c5854131e140e6f72181f80a8aee3827dd1ab8508230f58bbff533591ddda49934b871396c63b358efed2fa')
sha512sums_i686=('9d28eb88d3404e2fdee218557d74321436ae927124a695ab25c06756a855ab217a47d429f1eb1702b962d55d81aff437629524f3eeb3b614802002973d6172d5')
sha512sums_aarch64=('e4ca6af1c3cd3a55b15a3d5cf04ee6883e3ef24e44b17b0186e474f01458b556be9985e7f73253d563f703d62d6d7a7ef81ce7d204e1615615d11e2f6cd859dd')
sha512sums_armv7h=('9aa1e62de47996e2dc92a1335e44adc3ce132e75a6203ac0b328f677292d27654dd659cf4ffd9fa1f99822e1ba42437d997e00ceed0efa84068f5be542d24d73')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
