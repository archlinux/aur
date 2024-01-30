# Maintainer: iddt <iddt@users.noreply.github.com>
pkgname=otf-linefont
pkgver=1.0
pkgrel=1
pkgdesc='Font for rendering line charts.'
arch=('any')
_name='linefont'
url="https://github.com/dy/${_name}"
license=('OFL')
makedepends=()
provides=("${pkgname}")
_tag='7107da8645bec5439b1e6b48e7be3176c7d7b893'
source=("${url}/archive/${_tag}.zip")
sha256sums=('c4e855cac81714ddf24192966bff3e79902e101cdafffea7072eef4abda65777')

package() {
    install -Dm644 -t $pkgdir/usr/share/fonts/OTF ${_name}-${_tag}/fonts/otf/*.otf
    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname ${_name}-${_tag}/OFL.txt
}

