# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code
_pkgname=@moonshot-ai/kimi-code
pkgver=0.33.0
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('49074364c4ef8d11adaf7823964e60a5152de472bdf0131c32e5d9d9f3e1e92c')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
