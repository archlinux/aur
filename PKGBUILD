# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=v1.0.3
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('x86_64')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=("https://github.com/estesp/manifest-tool/releases/download/${pkgver}/manifest-tool-linux-amd64")
sha256sums=('9325b1f363ec5454ff03b53c09b37ed26437c953c58cd234fabf661561901b6b')

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
