# Maintainer: Abubakar Omer <aur@aolabs.dev>

pkgname=talanoa-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="Talanoa is a modern email client that is designed to be fast, secure, and easy to use"
arch=('x86_64')
url="https://talanoa.email"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'gtk3' 'gvfs' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'xdg-utils')
optdepends=('libgnome-keyring')
options=('!debug' '!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/talanoa-email/desktop-releases/releases/download/v${pkgver}/talanoa_${pkgver}_amd64.deb")
sha224sums=('d7d0741d2b4138e9800900831bdb2e4ff896486d5fed92f84f24f5a5')

package(){
    tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
    cd "${pkgdir}"
    install -D -m644 "usr/lib/talanoa/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "usr/share/doc/talanoa/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    rm -rf "usr/share/doc"
}
sha224sums=('0ffcdfaa2cbe1fbae2044a952845a478be49d40e715e4872c1f42b27')
sha224sums=('67575151f8d062f925e2cd448d2a4dca6be5524210ebad343b6a794c')
sha224sums=('e7be40e1bcc5acb79ba14735fac864ea707fbfb07efb392ac026f478')
sha224sums=('837ad1ee15e1ec757da018a9d27eaf07882af424f2dd2d00d8b38a9a')
sha224sums=('cc9b9b6127907b0796f3585c5f12f6a21eac321f85927dd9114865c3')
sha224sums=('847e949577801c2b03bdebcff8c3c5ca2a7d4e69cca760d7599bf888')
sha224sums=('475515d689a5012674935dfc03be223e7d9f4fa7b35518aa8fbb9125')
sha224sums=('96d7e8f071de49af82630dfee7c49ef1e1a41e27be5b4fc47c183edf')
sha224sums=('49c24c677b272c548de27517f90ece7466180bacbc27fba6e4b76fcc')
