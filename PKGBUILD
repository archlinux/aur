# Maintainer: Leon Kowarschick <thereal.elkowar at gmail dot com>
pkgname=pipr-bin
pkgver=0.0.12
pkgrel=1
conflicts=('pipr-git')
makedepends=()
depends=()
optdepends=('bubblewrap: run commands in isolation. STRONGLY RECOMMENDED!')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A commandline-utility to interactively build complex shell pipelines"
license=('MIT')
source=('pipr::https://gitlab.com/Elkowar/pipr/uploads/00023095ec8fc86d2af15be0ad07c51b/pipr'
        'pipr-git::git+https://gitlab.com/Elkowar/pipr.git')
url="https://gitlab.com/Elkowar/pipr"
md5sums=('SKIP'
         'SKIP')


package() {
    cd "$srcdir"
    install -Dm 755 pipr -t "${pkgdir}/usr/bin"
    cd "$srcdir/pipr-git"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
