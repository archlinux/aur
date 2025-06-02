# Maintainer: Ton nom <ton_email>
pkgname=iris-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="iris-cli est un visionneur d'anime en ligne avec une interface simple et intuitive. (Inspiré de ani-cli mais pour les français)"
arch=('any')
url="https://github.com/irisihrz/iris-cli"
license=('GPL')
depends=('bash')  # Assure-toi que cela inclut toutes les dépendances nécessaires
source=("git+https://github.com/irisihrz/iris-cli.git")
md5sums=('SKIP')  # Git n'a pas de checksum donc on met SKIP

package() {
  cd "$srcdir/iris-cli"
  
  # On installe le fichier `iris-cli` dans /usr/bin
  install -Dm755 iris-cli "$pkgdir/usr/bin/iris-cli"
}
