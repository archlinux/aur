# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.5
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

sha512sums_x86_64=('1f5d190fb14a75151f3a4e22d6896dc23ce0432b469c7f7e2f1fe3362abbc7006358a31142670a638e9c8921da97e4bb025eafc1b7803517d33aa3b8f70265d9')
sha512sums_i686=('7c03cff73fa383e533df44e93bde718fd866d2d1b0e4c8d1a34555fb33da37a3b9e9cef55b487aa31c2e0d480a5325f923556afead95a5a4b9cf6707d71a9b8c')
sha512sums_aarch64=('c828f7150efb8db7c64e00bed83a7bc7b91ee5d4c804c1d4361d8a6917bddf82dda611e14fbddfb6992dc74d4a27972a52afa2aed19c5318bfaf54d69f7ce6b1')
sha512sums_armv7h=('9013d75bac213dd8c26317667c258b4e91c3c8596aee412ccc63c765fdf59dcb27bcf3ec12e9478e6bdf341e13f3d719bca5eddfd14050e2b77263660acc3709')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
