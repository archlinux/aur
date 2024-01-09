# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.0.0
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("custom")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('a7879d07de10c241ebdf355b9041294a4994f7963c6bbf74ba3627008f186708a91431530d0e0c6a62ab41be84a6b0da5a0d001cb91ca29390f7298b5174fe5c')
b2sums_aarch64=('884d75e899459aa7dce969079c382b79d5339558fa2f9c96ff427f94e69c7e9d36b267d068d43d05169ee623c179bc8487eea0de2299267beb318053cd659074')
b2sums_armv7h=('fa85f2258a6c9c2c84b9f3cede897ca291d3eb232a699a5d047dd311e81f2ba1d30038ad5bba51e1f8b2bd92da67de0ba7dec6bfd72b8d560627ead2557d852c')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
