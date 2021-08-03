# Maintainer: eNV25 <env252525@gmail.com>

pkgname=run-desktop
pkgver=0.0.1
pkgrel=1
pkgdesc=".desktop file launcher. Can to run .desktop files using xdg-open."
arch=(any)
url="https://aur.archlinux.org/packages/run-desktop/"
license=('GPL')
depends=(python python-gobject)
source=(run-desktop.py run-desktop.desktop)
install=run-desktop.install

package() {
	install -Dm755 "${srcdir}/run-desktop.py" "${pkgdir}/usr/bin/run-desktop"
	install -Dm644 "${srcdir}/run-desktop.desktop" "${pkgdir}/usr/share/applications/run-desktop.desktop"
}

sha256sums=('96485f5a3be54ba244e402aacaf5c8942403a858e17a3c21f0356b8790220576'
            'a8201dd5b780e7c7e4911286a8a69c74440e00c0e9bb3f5c1c8b03c7e5f287ce')
