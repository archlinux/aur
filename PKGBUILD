# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=v2.0.6
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('x86_64')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=("https://github.com/estesp/manifest-tool/releases/download/v2.0.6/binaries-manifest-tool-2.0.6.tar.gz")
sha256sums=('4d8a502f2d3b82a50cfde65274ff6df7ef6fe441dc65b96b595a70cc64ece5bc')

build () {
    tar -xzf "${srcdir}/binaries-manifest-tool-2.0.5.tar.gz" -C "${srcdir}/"
}

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
