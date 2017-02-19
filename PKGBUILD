# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Narthana Epa <narthana.epa+aur@gmail.com>

pkgname=kde-servicemenus-komparemenu
pkgver=0.1
pkgrel=3
pkgdesc="A KDE service menu for comparing selected files/folders with kompare"
url='https://www.kde.org/applications/development/kompare/'
arch=('any')
license=('GPL')
depends=('dolphin' 'kompare')
source=(komparemenu.desktop)
sha256sums=('58f97ff0ad14028fb285ac1eb53367cef156afed202046cce9724385b62f359a')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/"    ${srcdir}/komparemenu.desktop
}
