# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.2.0
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
b2sums_x86_64=('74e0e66829df710c56c1d1bd146ead48a3d7eaf7737b4b94c5672c04e281408d3f9aa8045e189a5e85a652c9d9915f35bcc6d14a4f197c6fd397b053a837be8d')
b2sums_aarch64=('2c06a24f7a4d7d2412d5c5ffe8ad0c2cbfb1a7d7c9bb7f014338aabcb4f0a24e25a03868ebd223eca6cfe3923771195c912fee5e1738086c40634d5915463255')
b2sums_armv7h=('b4b9142e430cb7c13a95d8ef1225e3def6652bd7c67b544c3ca5e3128a352b0429eb555360411a68620b5bae155aefa95a14aa7f0e7454649289821096dc499e')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
