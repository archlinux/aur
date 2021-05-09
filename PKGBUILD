# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.1.5
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/$pkgver/kelpdot-aur.tar.gz")
sha256sums=("8f01ee6aa55092053a7e3b65f0b006d04f3a44e1e7bf4a2fee5adebde750d992")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
