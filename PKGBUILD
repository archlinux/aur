# Maintainer: fossdd <fossdd@pwned.life>

pkgname=pacman-python
pkgver=1
pkgrel=0
pkgdesc="Shows you archlinux packages for the specific pip package"
depends=('python' 'python-requests')
arch=('any')
url="https://aur.archlinux.org/packages/pacman-python"
source=("pacman-python.py")
license=('Unlicense')
sha512sums=('0eefba1155b4436bbb472b725976fc7304d48cc26602041992374c30a4b8c0c38c4b1a122146f906671431fa9597ca7291e1b0f762dcfb286b2425c54c52359f')

package() {
    install -Dm755 "pacman-python.py" "$pkgdir/usr/bin/pacman-python"
}
