# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=v1.0.2
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('any')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=('https://github.com/estesp/manifest-tool/releases/download/${pkgver}/manifest-tool-linux-amd64')
sha256sums=('5ffc16ce4abab56000d7ae8bb97d6e04870a06826a6caf7b409f8f313692a0ec')

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
