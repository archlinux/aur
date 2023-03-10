# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.0.16
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=("x86_64")
url="https://github.com/yetone/openai-translator"
license=('MIT')
provides=("openai-translator")
conflicts=("openai-translator-git" "openai-translator")
depends=('webkit2gtk')
source=(
    "https://github.com/yetone/openai-translator/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.deb"
)
sha256sums=('d49ac8bb0e5c280fab9d9de28fcc14dfd63a1ad00593c4ea9a5398510a22378a')

package() {
    cd "$srcdir/"
    tar -xvf data.tar.gz
    install -d ${pkgdir}/usr/
    cp -r $srcdir/usr/* ${pkgdir}/usr/
}
