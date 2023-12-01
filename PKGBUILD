# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.1
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

sha512sums_x86_64=('50f3ba45a28b521bd13582db4fb1410bc31113c4d3349f9f06736bf0ead969ab24863e4dbfbb190a31baa93ba51097c211efdeeeca5aa43b1c8d3f940c9111c2')
sha512sums_i686=('3186cf61fad2be4e2e40e8df8bfa0f711dee9372a77f539d6023ac16de4ee39f2ea3426b02a985f6c9b780e9c0062e51ea2870d5f4eb23cadeeafdac11d1f16c')
sha512sums_aarch64=('c1df939ba69241b9eb225cba49532ef0755e40213c4a35318d9ecb937271b2f4ef68a9365e0f03f63b728957b29b1a33a96a35b1b3c50c3302e35d2351768015')
sha512sums_armv7h=('396172d89cd0bf02f3c739e68395e675a56fb29544258e786b43a719aee38409c4cfd4d10f64c929cf27db43ebba86abb96a89ab9e17f31ea7b80caa4487aaf3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
