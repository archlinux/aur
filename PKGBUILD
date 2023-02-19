# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cmcl
pkgver=2.1
pkgrel=15
epoch=
pkgdesc="A Launcher for Minecraft Java Edition Running On The Console"
arch=('any')
url="https://github.com/MrShieh-X/console-minecraft-launcher"
license=('GPL3')
groups=()
depends=('bash')
makedepends=("git")
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
sha256sums=("474c0c3a7401c2e32175be818379833dd3b2fd1009cccc2eeebf754f38055ad5")
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
