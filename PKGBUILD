# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-servicemenus-pastebinit
pkgver=0.1
pkgrel=1
pkgdesc="A KDE service menu for sending files to pastebin like sites"
url='http://example.com'
arch=('any')
license=('GPL')
depends=('kdebase-dolphin' 'xclip' 'pastebinit')
source=('pastebinit.desktop')
install=pastebinit.install
sha256sums=('db67bbf3ab0c831504dd95622199025b5a63d6849d2b82aafe6dd3e009fdac4a')

package() {
    install -dm755 ${pkgdir}/usr/share/kde4/services/ServiceMenus/
    install -D -m644 pastebinit.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/
}
