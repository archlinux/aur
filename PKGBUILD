
pkgname=passer-git
pkgver=1.0.8
pkgrel=1
pkgdesc="passer is a password generator based on passphrases"
arch=(any)
url="https://github.com/spynetS/passer"
license=(GPL3)
depends=(python3 xclip python-pyperclip python-passlib python-flagser)
source=("git+https://github.com/spynetS/passer.git")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

package() {
    cd passer
    install -Dm755 ./passer.py "$pkgdir/usr/bin/passer"
}
