# Maintainer: Aaruni Kaushik <akaushik@mathematik.uni-kl.de>
_name=maps
pkgname=maps
pkgver=0.4
pkgrel=1
pkgdesc="Sandboxing tool for Mathematical Research Software"
arch=('x86_64')
url='https://github.com/aaruni96/maps'
license=('GPL3')
depends=('base-devel'
         'openssl'
         'cairo'
         'git'
         'gobject-introspection-runtime'
         'python3'
         'ostree'
         'meson'
         'python-tomli'
         'python-gobject'
         'python-progress'
         'python-tuspy'
         )
conflicts=('maps')
provides=('maps')
optdepends=()
makedepends=('git')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf8fa1dcc8f6dba1718ae0ff83b313439f756d6f6c22a269aee5c04282bbe2ca')

package(){
    install -Dm 755 "$srcdir/${_name}-${pkgver}/src/maps" "$pkgdir/usr/bin/maps"
    install -Dm 644 "$srcdir/${_name}-${pkgver}/src/completion.bash" "$pkgdir/usr/share/bash-completion/completions/maps"
}
