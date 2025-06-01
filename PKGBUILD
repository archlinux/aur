# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact <admin@azccriminal.space>
pkgname=crl-browser
pkgver=1.0
pkgrel=1
pkgdesc="CRL Browser - PyQt6 based Arch-browser."
arch=('any')
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests')
source=("crl-browser.py")
sha256sums=('0f1edfd938a395fa0317288e632023a8b979b21f603377d050fd0586b4d8613d')  

package() {
  install -Dm755 "${srcdir}/crl-browser.py" "${pkgdir}/usr/bin/crl-browser"
}
