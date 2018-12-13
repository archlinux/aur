# Submitter: yaute <yaute74@gmail.com>

pkgname=plasma-applet-custom-notifier
pkgver=1.0
pkgrel=1
pkgdesc="Plasmoid to be notified of updates with custom scripts."
arch=('any')
url="https://gitlab.com/yaute74/custom-notifier.git"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
source=("https://gitlab.com/yaute74/custom-notifier/uploads/ccddc6a588b81e9f8277934b09f8675e/custom-notifier-$pkgver.plasmoid")
md5sums=('c39b91b3a790deb9f5fb1b172abdb6a7')

package() {
    rm custom-notifier-$pkgver.plasmoid

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.custom-notifier
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.custom-notifier
}
