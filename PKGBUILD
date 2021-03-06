# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>
pkgname=quicknav-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("x86_64")
provides=("quicknav")
options=("strip")
source=("https://github.com/MrDogeBro/quicknav/releases/download/v$pkgver/quicknav-$pkgver-x86_64.tar.gz")
sha256sums=("f6626af4f1fcd7b791b8d7806ed8dd8489062eae2984352ee19b3e1d0466880c")

package() {
    install -Dm755 quicknav -t "$pkgdir/usr/bin/"
}
