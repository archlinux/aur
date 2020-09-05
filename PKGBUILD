# Maintainer: Leon Kowarschick <thereal.elkowar at gmail dot com>
pkgname=pipr-bin
pkgver=0.0.13
pkgrel=1
conflicts=('pipr-git')
makedepends=()
depends=('bubblewrap')
optdepends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A commandline-utility to interactively build complex shell pipelines"
license=('MIT')
source=('pipr::https://github.com/elkowar/pipr/releases/download/v0.0.13/pipr'
        'pipr-git::git+https://github.com/Elkowar/pipr.git')
url="https://github.com/Elkowar/pipr"
md5sums=('SKIP'
         'SKIP')


package() {
    cd "$srcdir"
    install -Dm 755 pipr -t "${pkgdir}/usr/bin"
    cd "$srcdir/pipr-git"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
