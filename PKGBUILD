# Maintainer : Nover <nicolas.guilloux@protonmail.com>
# Heavily inspired by https://aur.archlinux.org/packages/uget-integrator/

pkgname=kget-integrator
pkgdesc="Integrate KGet Download Manager"
arch=('any')
url="https://github.com/NicolasGuilloux/KGet-Integrator"
license=('GPL3')
depends=('python3' 'kget')
makedepends=()
pkgver=v1.1.1
pkgrel=1
source=("kget-integrator-$pkgver::https://raw.githubusercontent.com/NicolasGuilloux/KGet-Integrator/v$pkgver/kget-integrator")
pkgdesc="Integrate KGet Download Manager with Google Chrome, Chromium, Vivaldi, Opera and Firefox"
md5sums=('29eb300bc60522c676b2ef466bfc6bb6')
optdepends=(
    'kget-integrator-chrome: native messaging hosts for Google Chrome'
    'kget-integrator-chromium: native messaging hosts for Chromium and Vivaldi'
    'kget-integrator-opera: native messaging hosts for Opera'
    'kget-integrator-firefox: native messaging hosts for Firefox'
)

build() {
    cd "$srcdir"
}

package(){
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "kget-integrator-$pkgver" "$pkgdir"/usr/bin/kget-integrator
}