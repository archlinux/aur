# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code                                                                                                                                                                                                                                                                   
_pkgname=@moonshot-ai/kimi-code
pkgver=0.11.0
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('4b6cbf522cbb4870d56e18e2852e20a6000b22a964bc605fe3448fba9603f489')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
