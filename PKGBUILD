# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=cmus-rpc
pkgver=2.0.0
pkgrel=0
epoch=0
pkgdesc="A Discord Rich Presence for cmus player using java 🎶☕"
arch=('any')
url="https://github.com/Anas-Elgarhy/$pkgname"
license=('MIT')
groups=()
depends=('jdk17-openjdk' 'cmus')
makedepends=()
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=()
replaces=("$pkgname")
backup=()
options=()
install=
changelog=
source=("https://github.com/Anas-Elgarhy/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()
package() {
    sudo install -Dm644 "./$pkgname.jar" "/usr/share/java/$pkgname/$pkgname.jar"
    sudo install -Dm777 "./$pkgname.sh" "/bin/$pkgname"
}
sha256sums=('9ac11cc9475f790eb91615edca198162ad43eae2e313f0885a3f067df3afe7d8')
