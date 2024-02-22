# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.7
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

sha512sums_x86_64=('e0b896d7ca0dc37008b9db7c1119a47bfd1ad1864937753324b948a2e6a4638d80348a798f09f31b406857295be863f29ca373081998260d479967e59e6ad3c3')
sha512sums_i686=('856697723a76016e2706ab43d6a2d75534151cd02b6eb350d9541826311b2ca208bdcab4ebf24be0fe0528e0a11d9d64b6d0eebdee96c988c62a6255f70ca0e6')
sha512sums_aarch64=('a9e20b30e150c0b4ccf8be42f847f781bdf725727d35d63afd97d0105b27a96fcdb69c4aafe75a12f78d5cd076870a18f4d33e9b82d070d17c9b29f79efe68cb')
sha512sums_armv7h=('f7036edecd02793473626818b509f70e94d840bad7e94b34a2a0b98eb1f9297922d145cf8f2eaf15d981393887f680aca1fc082aa0e466697f899919dd259664')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
