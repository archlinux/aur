# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.11.0
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

sha512sums_x86_64=('1be8937f981d4bece97401fa1d47ba63eb5ad91ac2e3f1997e0ba354f8aadb4bf2fafd9ef042bc239672ea37a241a6dbfa60c4e3e809dae0d2a9b56a283e9942')
sha512sums_i686=('84ea37e5b1315869a606dfecd17623458447171f1d431882086c2efb8b19312fbc6182de9f42ed026b032345aaa37576726061322cc9c4997d0dd21a5ed53057')
sha512sums_aarch64=('89ad01ffb0fd5e2d06427ba41c5e87c0fdfeac6c22223edbad20b5578d838658db41620f9f78547fa4520f90b4373714ac16d5d34d4dbd69e4d2477b2d4bbe8b')
sha512sums_armv7h=('eaaf2e3937093df2b81b9f69453386981275e6560691540800b1c157ac37b7283fcafbf8ac91f488a07fcb0d1487b9279f9da2f05e209a7741ccddece4012c00')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
