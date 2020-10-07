# Maintainer: lmartinez-mirror
# Contributor: desbma
pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.4.3
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${_pkgname}"
license=('MIT')
provides=('zoxide')
conflicts=('zoxide' 'zoxide-git')
source_x86_64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-$CARCH-unknown-linux-gnu")
source=("LICENSE::https://raw.githubusercontent.com/ajeetdsouza/${_pkgname}/v${pkgver}/LICENSE")
sha512sums_x86_64=('610110647775358f5db7ad069ef43c725a33b1caedcec573cf9546d4a701214ca995ab6bbc01f73a7b8c79d24d23e7eefaee2d194fce76a71b6165a077431490')
sha512sums=('abf8fa83fc3e17f92046611974d837029da055eb53d5d17ac0453e6edef27ed172416376751be76833a2a54d28e1d173bb82635ff62ba51ebcca3733d51600c3')
options=(strip)

package() {
    install -Dm 755 -t "${pkgdir}/usr/bin" ${_pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
