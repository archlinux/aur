# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Repeater <fakeroration@gmail.com>
# Contributor: mail_set <youremail@domain.com>
pkgname=cmcl
pkgver=2.2.2
pkgrel=22
epoch=
pkgdesc="A Minecraft Java Edition Launcher Running on the Command Line"
arch=('any')
url="https://github.com/MrShieh-X/console-minecraft-launcher"
license=('GPL3')
groups=()
depends=('bash' 'java-runtime')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MrShieh-X/console-minecraft-launcher/releases/download/$pkgver/$pkgname")
noextract=("$pkgname")
validpgpkeys=()

prepare() {
    rm -rf $pkgname-$pkgver
    mkdir -p $pkgname-$pkgver
    mv cmcl $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
sha256sums=('bd655e3679836956c78094954b9290a2b2c57cb82775a1f593ed25ef697ad0d3')
