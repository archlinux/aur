# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.2
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

sha512sums_x86_64=('2fc4f5c64dfad7a2f65d6a0b102341b07e8b2eb7e6972e26d26dcce8acc673118559c385c1a2091c263d34bdea3b7726bc2b6558742841a1ae4f8b2757c335cb')
sha512sums_i686=('7d0c904a5ed10df025c6a9631a3b415530d06ac2173335603666209303f4584129e6efc4edb15163a8a304815ce30fcc0220a26ecf9b20f84d74e416db47cf8d')
sha512sums_aarch64=('a1edc839280335024dc879a15445e70780b77e871f7b737a7fdcb1ec6e782894221cab2e54ba6c2f721b41f86254c002019a463ae439b05c431ed286df4d9bd7')
sha512sums_armv7h=('f50b10f520b68274a60979e4def1b2caac742083c2c6bc27195cc8cefd5cb86e1f36997d29c3208ebc9f866a4f056a6430eb2b36a9a2b8c353037543d8ac9779')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
