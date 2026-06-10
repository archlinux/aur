# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code                                                                                                                                                                                                                                                                   
_pkgname=@moonshot-ai/kimi-code
pkgver=0.12.1
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('16a18aeefd3ddbb99399dd4f1c882d05996ea1744bccf36db1aeb887cd1851f6')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
