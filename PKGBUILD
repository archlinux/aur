# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code
_pkgname=@moonshot-ai/kimi-code
pkgver=0.25.0
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('6eb5f93da0a4c24ad4b4648535f3bd577daab93fd4aa418707e7dee5ffa3ce90')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
