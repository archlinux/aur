# Maintainer: lmartinez-mirror
# Contributor: desbma
pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.5.0
pkgrel=1
pkgdesc='A fast cd command that learns your habits (binary release)'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${_pkgname}"
license=('MIT')
provides=('zoxide')
conflicts=('zoxide' 'zoxide-git')
source_x86_64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-$CARCH-unknown-linux-gnu")
source=("LICENSE::https://raw.githubusercontent.com/ajeetdsouza/${_pkgname}/v${pkgver}/LICENSE")
sha512sums_x86_64=('0c9c66f4829b4069e7735bfc54cfe6cdc734b43b9612e4d7303f43e0d5e1b0af8e50d74136d8e56a74d297074cc4b58786b67e915529708577eb7b3b17868256')
sha512sums=('abf8fa83fc3e17f92046611974d837029da055eb53d5d17ac0453e6edef27ed172416376751be76833a2a54d28e1d173bb82635ff62ba51ebcca3733d51600c3')
options=(strip)

package() {
    install -Dm 755 -t "${pkgdir}/usr/bin" ${_pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
