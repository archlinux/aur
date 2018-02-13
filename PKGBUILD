# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-servicemenus-pastebinit
pkgver=20180213
pkgrel=1
pkgdesc="A KDE service menu for sending files to pastebin like sites"
url="https://aur.archlinux.org/packages/${pkgname}"
arch=('any')
license=('GPL')
depends=('dolphin' 'xclip' 'pastebinit')
source=('pastebinit.desktop')
install=pastebinit.install
sha256sums=('db67bbf3ab0c831504dd95622199025b5a63d6849d2b82aafe6dd3e009fdac4a')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/"    ${srcdir}/pastebinit.desktop
}
