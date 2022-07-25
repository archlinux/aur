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
sha512sums=('6c403d0dde947b4c72d5fffa253015dae654366ed8bf98aa148b71b9591127af17d0f3d7fb95791851c94d077655cba82e4793bb2582c753801a153c4a6e0859')

package() {
    install -Dm755 "pacman-python.py" "$pkgdir/usr/bin/pacman-python"
}
