# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cmcl
pkgver=2.1.1
pkgrel=16
epoch=
pkgdesc="A Launcher for Minecraft Java Edition Running On The Console"
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
sha256sums=("16a9164c3cc712d3d81839b59ca2154e36fe964efa16ba8a23eaa2a7fcb357d5")
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
