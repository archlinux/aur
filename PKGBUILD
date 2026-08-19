# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.7
pkgrel=1
pkgdesc="A cross-platform software for text translation."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL-3.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('66394ff9b79331612c258da1309a248faa2093f2d10004708f1faaaa2fcb92d18ea34e8a66db786bdfb6e52c71bdf7587ecb619d05ba6d1e7c77bb687f86aa63')
sha512sums_i686=('ec307f76b4631ffa4a55e6a079bb23edad8225d3c377c1f2eda4da1b4a68d47981f729f840cefc85aecfae704fe009a824eda3507521094736a4fd77738ef0ae')
sha512sums_aarch64=('842b271945ccb2d11c7793984c72577e75530e580ab553672d94647a63efab4aedce242bbe7ce5d4b3c15d38339454e6daea653f2661b7ff9af21d4522053356')
sha512sums_armv7h=('e8143f193a342f81d98d1e335157053e07e8cb4fa2f17e704f99a607767a03a462e628d0a40c6bcd63aa1b0653ca460d5dffdc0c85966590c839cffea645e31d')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
}
