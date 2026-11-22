# Maintainer: Eric Renfro <psi-jack@linux-help.org>
pkgname=clamaurscan-git
pkgver=r1.0f5b135
pkgrel=5
pkgdesc="Automatically scan AUR packages with ClamAV before building them with Paru."
url="https://codeberg.org/psi-jack/clamaurscan.git"
license=("GPL-3.0-or-later")
source=("git+$url")
md5sums=("SKIP")
arch=('any')
depends=("bash" "clamav" "pacman" "findutils")
optdepends=("paru" "yay")
makedepends=("git")
conflicts=("aurscan-git")

package() {
    cd "clamaurscan"
    install -Dm755 --no-target-directory "clamaurscan" "${pkgdir}/usr/bin/clamaurscan"
    install -Dm755 --no-target-directory "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
