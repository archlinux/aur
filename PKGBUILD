# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=rusticon-bin
_name=${pkgname%-bin}
pkgver=0.2.2
pkgrel=1
pkgdesc='A mouse driven SVG favicon editor for your terminal'
arch=('x86_64')
url="https://github.com/ronilan/$_name"
license=('CC-BY-NC-ND-4.0')
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('537fa9cec352d2e096ced3f113b6388bd703afcbbd7f4783ade144ee236e2b9f')
b2sums_x86_64=('2016c91a9b8abd2082adad3a5059fa5f838de1949a6dc9ac263d2351fad1b9ca5953520f700acc46f0436ea0303eef8ab6fd12653011ca26cfcaed0b14942835')

package() {
    install -Dm755 $_name-v$pkgver-$CARCH-unknown-linux-musl/$_name "$pkgdir/usr/bin/$_name"
}
