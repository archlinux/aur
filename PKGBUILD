# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=slimbookbattery
pkgver=3.10beta
pkgrel=2
pkgdesc="Slimbook Battery. Is a battery optimization application for portable devices that can increase the battery life by 50%. For this purpose, the third-party software (TLP and others) is used to manage and configure the system resources."
arch=('any')
url="http://slimbook.es"
license=('Creative Commons BY-NC-ND 3.0')
groups=()
depends=('bash-completion' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gobject-introspection-runtime' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libindicator-gtk2' 'libnotify' 'logwatch' 'python' 'python-cairo' 'python-dbus' 'python-gobject' 'python-pillow' 'tlp' 'tlp-rdw' 'xorg-xdpyinfo')
backup=('etc/systemd/system/suspend-sedation.service')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha512sums=('c37eb6c159ec4ea94f9d6e8066359433bb9923b1999a8a7d22036e2177cf410adb6ff1126b5cb96d275e958a1087b7660cea9a05d3a61ac81f60ac8e947edb39')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
