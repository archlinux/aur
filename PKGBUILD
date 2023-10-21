# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.5
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

sha512sums_x86_64=('592df56c95aa3504dec1a2238bc787ee24a4797adf65874d2e9d3a2c24e2a9273d3fb47a978eba3188df1ad1e0fd0923d636f3d7116ddf07d68217bdd9091803')
sha512sums_i686=('a8cb7e0821a23ca33b373e9115ff09ab707e5411ad58c98cd7e1d09ad2281f68fa9cb08ff0014e311ece68ffec4bd4321ee02fd43eba49178a4816e9c40f659e')
sha512sums_aarch64=('f6de3fb02583b2826e89f82e4073e2d55d8d970104b23dbaad2e6c2620527243bc0b7f1945beb3f3c498d4866065bc6b9aa1908fd558fa596f13940cacb9c0b3')
sha512sums_armv7h=('c448d8d7bd46e797a87555b3495e7fa35077a1851ed36eb27c8d905e5d44e8dc3586e0b5d371e443f451f429464549c82b40f32959c77cbfcde080155aeca954')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
