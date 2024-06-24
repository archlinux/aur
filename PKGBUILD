# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.2
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

sha512sums_x86_64=('68786a57ffa02c9eca397b09437eb0704ad7e207e93581bd9a5b04620841081bb77c31d8c14c4961f0e1e7eb1f06e711635729d1aa610df5512e546b49e3c254')
sha512sums_i686=('4c3196f2ab3ebe60e95f313ff1ab75c5bb76fd3e07f6f295447124deec3bed48cf57699334212fb0b0e5c9a387a5e70f358ae71ee40be3fdb7f333cb17e6623d')
sha512sums_aarch64=('19a87dae8c664cfeb4687fc02661201a75ffed781fd75d683632d61bd7df03d87970aa319c9fdd88cefd9095ac66d7c90e3d77dddd51900197af9987c6e4e15d')
sha512sums_armv7h=('02572288524dee59f2b0a675367bb678ef89134c735a18536114ba569e4dba396701bee4b9d49d671314aa747c96f771a916f2e2dfc7623cbff2e7aabfeff2b9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
