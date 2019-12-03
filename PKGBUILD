# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=kali-undercover
pkgver=2020.1.0
pkgrel=1
pkgdesc='Kali Undercover Mode'
arch=('any')
url='https://gitlab.com/kalilinux/packages/kali-undercover/'
license=('GPL3')
depends=('python-gobject' 'xfce4-session' 'xfce4-panel' 'xfdesktop' 'xfwm4' 'ttf-liberation')
optdepends=('xfce4-whiskermenu-plugin: for menu on undercover mode'
            'xfce4-notifyd: for settings restored notification'
            'libnotify: for settings restored notification'
            'psmisc: for clearing existing notificaion')
source=(https://gitlab.com/kalilinux/packages/${pkgname}/-/archive/kali/${pkgver}/${pkgname}-kali-${pkgver}.tar.gz)
sha256sums=('34fcab349709f72f8218c7b9a6dc92884eb21c78ecbe118b921a16d237805a63')

package() {
  cd ${pkgname}-kali-${pkgver}
  install -d "${pkgdir}/usr"
  cp -dr bin "${pkgdir}/usr/bin"
  cp -dr share "${pkgdir}/usr/share"
}
