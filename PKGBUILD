# Maintainer: Marcel Campello <marcel.campello@prafrentex.com.br>
# Contributor: Francesco Zardi <frazar0 [at] hotmail _dot_ it>
# Contributor: Rocky Prabowo <rocky [et] lazycats *dot* id>
# Contributor: Tom Knight-Markiegi <tom.knight@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
pkgname=structurizr-cli
pkgver=2025.05.28
pkgrel=1
pkgdesc="A command line utility for Structurizr, designed to be used in conjunction with the Structurizr DSL"
arch=(any)
url="https://github.com/structurizr/cli"
license=('apache')
depends=('java-runtime>=17')
optdepends=('graphviz: export command')
source=("https://github.com/structurizr/cli/releases/download/v${pkgver}/structurizr-cli.zip"
        "launcher.sh")
sha256sums=('bbe87f7bdcc272755e0bc056fe1641dc4e95d263f109e6733daea96d8acdadc5'
            'd360ef7d8ac0106c3e735d3f74628ed24e6604ad7bc254d4b85a49a5b933bf27')


package() {
  install -Dm644 -t "$pkgdir/opt/$pkgname/lib" lib/*
  install -Dm755 -t "$pkgdir/opt/$pkgname" structurizr.sh
  install -Dm755 -T launcher.sh "$pkgdir/usr/bin/structurizr"
}
