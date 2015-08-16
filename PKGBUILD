# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=keepass-serpentcipher
_pkgname=SerpentCipher
pkgver=1.0
pkgrel=1
pkgdesc="Enables KeePass to encrypt databases using the serpent algorithm."
license=('GPL3')
depends=('keepass')
arch=('any')
url="https://github.com/drizzt/KeePass-SerpentCipher/"
source=("https://github.com/drizzt/KeePass-SerpentCipher/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('5e52d648845bc955ad18609313e8ce415a7d5cb5ddc342845656cc131518c8b3')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
