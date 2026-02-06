# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=aspire-cli
pkgver=13.1.0
pkgrel=1
pkgdesc='Aspire provides tools, templates, and packages for building observable, production-ready distributed apps.'
arch=('x86_64' 'aarch64')
url="https://github.com/dotnet/aspire"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('aspire')
source_x86_64=("https://ci.dot.net/public/aspire/${pkgver}-preview.1.25616.3/${pkgname}-linux-x64-${pkgver}.tar.gz")
sha256sums_x86_64=('88ecfa3bf213a9c8492e0ef262e212c4d880f2e05becdf95bc0fe2fd226b4d94')
source_aarch64=("https://ci.dot.net/public/aspire/${pkgver}-preview.1.25616.3/${pkgname}-linux-arm64-${pkgver}.tar.gz")
sha256sums_aarch64=('258ab9dce38c42429d6d738cc9699fa9843fd835216d12652fc00054d9359ae4')

package() {
    install -Dm755 aspire "$pkgdir/usr/bin/aspire"
}