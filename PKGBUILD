# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=gliderlabs-sigil
pkgver=0.6.0
pkgrel=1
pkgdesc='Standalone string interpolator and template processor'
arch=('x86_64')
url='https://github.com/gliderlabs/sigil'
license=('BSD')
# a package with the same name exists and provides a binary with the same name
conflicts=('sigil')

source=("https://github.com/gliderlabs/sigil/releases/download/v${pkgver}/sigil_${pkgver}_Linux_x86_64.tgz"
        'LICENSE')
sha256sums=('303c9d9aaa24da05998e7138cfa96e3ee032ff3ce4a89cf682203b94f2cfe15e'
            '90b8e840cef9b3c39c1419cf394efe2480544056f55d7d709f3c1b4f47fe9321')

package(){
  install -Dm755 sigil "$pkgdir"/usr/bin/sigil
  install -Dm7644 LICENSE "${pkgdir}/usr/share/licenses/gliderlabs-sigil/LICENSE"
}
