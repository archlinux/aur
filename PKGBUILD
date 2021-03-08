# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/$pkgver/kelpdot-aur.tar.gz")
sha256sums=("d4f55f4e1d12778235d3c7ed7773a2f82ab4afc2c38e50c2fb25dd666cd379e2")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
