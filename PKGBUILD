# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=v2.0.3
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('x86_64')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=("https://github.com/estesp/manifest-tool/releases/download/v2.0.3/binaries-manifest-tool-2.0.3.tar.gz")
sha256sums=('78971079cc0d8eddd90751fe6d8bf9b10ecf73a5476103d3673bf39b5da961d3')

build () {
    tar -xzf "${srcdir}/binaries-manifest-tool-2.0.3.tar.gz" -C "${srcdir}/"
}

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
