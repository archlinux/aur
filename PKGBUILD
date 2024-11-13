# Maintainer: fossdd <fossdd@pwned.life>

pkgname=pacman-python
pkgver=3
pkgrel=0
pkgdesc="Shows you archlinux packages for the specific pip package"
depends=('python' 'python-requests')
arch=('any')
url="https://aur.archlinux.org/packages/pacman-python"
source=("pacman-python.py")
license=('Unlicense')
sha512sums=('62ea669ca816925460315ce98465eddb880b8ee4cd1ea0b1029ff888b868ac03cfd15e2386e092ed8f644e1cd22e8260a9ad452465f3688f302a1eaf7eca29c4')

package() {
    install -Dm755 "pacman-python.py" "$pkgdir/usr/bin/pacman-python"
}
