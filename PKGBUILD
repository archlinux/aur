# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgname=$_pkgname-bin
pkgver=0.6.0 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
pkgrel=1
pkgdesc="High-performance code intelligence MCP server with persistent knowledge graph"
url="https://github.com/DeusData/$_pkgname"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source_x86_64=("$_pkgname-x86_64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-aarch64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64.tar.gz")
sha512sums_x86_64=('222407a2784a493493668ec884eb55cc3dd2989afdccc82bf376aa76f185ebfc444458d72a58d434f85dbcd6db66f216b3128e538017a8afb730ec8f1500c08b')
sha512sums_aarch64=('e6db8b19eb4bc3cb263260c58da3d88c4a9f922b1b3623de024668b746e46439cec53ae8d633c52bdb0f764f19f0f0a44c56c09cd194ba3ab93eeb0c1efdcfc0')

package() {
    install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
