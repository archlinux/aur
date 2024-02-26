# Maintainer: fossdd <fossdd@pwned.life>

pkgname=pacman-python
pkgver=2
pkgrel=0
pkgdesc="Shows you archlinux packages for the specific pip package"
depends=('python' 'python-requests')
arch=('any')
url="https://aur.archlinux.org/packages/pacman-python"
source=("pacman-python.py")
license=('Unlicense')
sha512sums=('5a7336d56d5dbf0f0b384daf429912b597bc48d32f04323227ea37543c752c2bc178fb7c2a7da9acbf193fa87af7ad1daffa5e5cb8d6d959cb458fd876d59ce4')

package() {
    install -Dm755 "pacman-python.py" "$pkgdir/usr/bin/pacman-python"
}
