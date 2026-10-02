# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code
_pkgname=@moonshot-ai/kimi-code
pkgver=2.1.1
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('6690a29d7b5e14812754dd100136b7f4ee2577add8895f00fe27025b4412049f')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
