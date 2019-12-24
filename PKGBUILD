# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=3.10beta
pkgrel=3
pkgdesc="A battery optimization application for portable devices"
arch=('any')
url="http://slimbook.es"
license=('CC BY-NC-ND 3.0')
depends=('python-gobject' 'python-cairo' 'python-pillow' 'python-dbus' 'libappindicator-gtk3'
         'gdk-pixbuf2' 'libnotify' 'tlp-rdw' 'cron' 'dmidecode' 'xorg-xdpyinfo')
optdepends=('arch-prime-git: for hybrid graphics switching'
            'gnome-shell-extension-appindicator: for tray icon on GNOME')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('da8397b2184af90b788c388d262b7fbf8d82181d30f6009db64ea5ef2071e980')

package() {
    tar xf data.tar.xz -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
