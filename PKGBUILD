# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code
_pkgname=@moonshot-ai/kimi-code
pkgver=0.14.3
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('78c9328c7013df6b0867b44c25927963c447044f3fe91ae0140d9446b6741504')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
