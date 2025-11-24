# PKGBUILD for firefox-kiosk-session
pkgname=firefox-kiosk-session
pkgver=1.0
pkgrel=1
pkgdesc="Firefox Kiosk Xsession"
arch=('any')


depends=('firefox')
source=("firefox-kiosk-session.desktop" "firefox-kiosk-session.sh")
sha256sums=('SKIP' 'SKIP')


package() {
install -Dm644 "${srcdir}/firefox-kiosk-session.desktop" "${pkgdir}/usr/share/xsessions/firefox-kiosk-session.desktop"
install -Dm755 "${srcdir}/firefox-kiosk-session.sh" "${pkgdir}/usr/bin/firefox-kiosk-session"
}
