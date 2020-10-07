# Maintainer Amin Wang <lagunawang@gmail.com>
# Contributor: Luis Martinez <xenotrumpet1997 at gmail dot com>
pkgname=mdr
_pkgname=mdr
pkgver=0.2.5
pkgrel=3
pkgdesc="A standalone Markdown renderer for the terminal."
arch=('x86_64' 'i686' 'arm')
url="https://github.com/MichaelMure/mdr"
source_x86_64=("${_pkgname}::${url}/releases/download/v$pkgver/mdr_linux_amd64")
source_i686=("${_pkgname}::${url}/releases/download/v$pkgver/mdr_linux_i386")
source_arm=("${_pkgname}::${url}/releases/download/v$pkgver/mdr_linux_arm")
source=("LICENSE::https://raw.githubusercontent.com/MichaelMure/mdr/v${pkgver}/LICENSE")
license=('MIT')
depends=('glibc')
replaces=('mdr')
sha512sums_x86_64=('a3ab5bf040644ae5a03d4ee385d8e05f3637293b858dc9aa9de3721337dfd4858a487e47b45d7a7b0ae6c7731613ddf1541134406d5871e72b96897f8a5c8dd2')
sha512sums_i686=('1f55ce4424eded23ef4530f959beaf51c16f9630c0f38f6d9e513a8b3a41113efff6950f84a8e3e955340e85bebc2fbb408e92572d68fdb787a5144b520910c9')
sha512sums_arm=('55ec31bb830a325eeddb6408cf0a0823d4f2853601936c302c1ab38f14b03e9b579943a8ee7d37ac6e4edd6c075b61ddfe7b6f9dff2c2b585be21f3a97131986')
sha512sums=('1327071f12551ce1e38232f9cad9401419b2661e7933362c686f96601ab8f1808f40651f70302e690c8228ac2dd6c933a2bed62e235b67d414850e4abf4bf070')
options=(strip)

package() {
    install -Dm 755 -t "${pkgdir}/usr/bin" "${_pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: se syn=sh:
