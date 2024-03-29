# Maintainer: Asher Winstead asher@mrashcreates.xyz
pkgname=optimizemyarch
pkgver=1.0.2
pkgrel=1
pkgdesc="A script to optimize and maintain Arch Linux installations"
arch=('any')
url="https://github.com/MrAshCreates/optimizemyarch"
license=('MIT')
depends=('bash')
source=("optimizemyarch.sh")
sha256sums=('6962c8139b68beb8fc7cb9be8b1cd3e020c70b6f928755c27b60d47438ec7802')

package() {
    install -Dm755 optimizemyarch.sh "$pkgdir/usr/bin/oma"
}
