# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=kimi-code
_pkgname=@moonshot-ai/kimi-code
pkgver=0.36.1
pkgrel=1
pkgdesc="The Starting Point for Next-Gen Agents"
arch=('any')
url="https://github.com/MoonshotAI/kimi-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('51a17caf5bbc7f5eb0c78b6957cffcb88a99d46ae405674d9ee26285198db6eb')
options=(!strip)


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
