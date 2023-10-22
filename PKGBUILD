# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.6
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

sha512sums_x86_64=('8b6470b680f805a31cd6143df34842b6c1a03bcec1f4b34fd5747be96fd37004d390d787daafa22466f9071819a5fea34ef100ffc3185a337fb09510c3f24b4c')
sha512sums_i686=('472ba0bb4d93af916635ad8c19315aa5262d37145f0c2160ffdac5e66bde923ddf7920ad04f50d6a5b0cb96c0451a1894dc9252122fcb0398450fde9eb83ae91')
sha512sums_aarch64=('1d24e12bbb04b4843480831efdab4d2877343a031a9eea25507df6d34f6860d1b2009aef058231f81c0506a3c205207765f286083e69002ffd20aba5760aeb0e')
sha512sums_armv7h=('f95326498f075a314394fdf3d74bfbea90524af215a5cb205ae21a5a722f1fd182f7e172f90bdece5a5d47253dbc16f503b2826d14680c62629ab4fcd7f15c30')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
