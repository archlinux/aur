# Maintainer: linsyking <xiangyiming2002@gmail.com>

pkgname=pdfannotator
pkgver=0.2.0
pkgrel=1
pkgdesc="A small pdf annotator built with pdf.js and tauri. Annotation stored in a separate file to be easily tracked by Git."
arch=('x86_64')
url="https://github.com/linsyking/pdfannotator"
license=('MIT')
depends=('webkit2gtk-4.1')
makedepends=('tar')
source=("https://github.com/linsyking/pdfannotator/releases/download/$pkgver/pdfreader_${pkgver}_amd64.deb")
sha256sums=('9ef12a59c55b16d42bdd828abbc8c1604d8aff81591f02442087b70ea72260f9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
