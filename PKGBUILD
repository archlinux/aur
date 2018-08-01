# Maintainer: Lázaro Millares <lazaro.millares@gmail.com>
pkgname=transfer-cli
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A client for https://transfer.sh service"
arch=(any)
url="https://github.com/Millares/transfer-cli.git"
license=('GPL')
source=("https://github.com/Millares/transfer-cli/releases/download/0.0.1/transfer-cli.jar")
md5sums=("8646f7c0880a36f4dc0907309bc26b0b")
package() {
    cd ..
    sudo mkdir -p /usr/share/transfer-cli/
    sudo cp transfer-cli.jar /usr/share/transfer-cli/
    sudo cp transfer-cli.sh /usr/bin/transfer
    sudo chmod +x /usr/bin/transfer
}
