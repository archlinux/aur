#Maintainers: MrPicklePinosaur
pkgname=matsuba-bin
pkgver=1.0
pkgrel=1
pkgdesc="lightweight japanese ime written in rust"
arch=('x86_64')
url="https://github.com/MrPicklePinosaur/matsuba"
license=('MIT' 'Apache')
groups=()
provides=(matsud matsucli)
depends=(xorg-xdotool xmodmap sqlite3)
makedepends=(cargo)
source=("$url/releases/download/v${pkgver}/matsuba-linux.zip")
md5sums=('SKIP')

package() {
    install -Dm755 matsud "${pkgdir}/usr/bin/matsud"
    install -Dm755 matsucli "${pkgdir}/usr/bin/matsucli"
    install -Dm644 matsuba_default.toml "${pkgdir}/usr/share/matsuba/matsuba_default.toml"
}

