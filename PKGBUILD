# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kobweb
pkgver=0.9.3
pkgrel=1
pkgdesc='Set up and manage your Compose for Web app'
arch=('any')
url='https://kobweb.varabyte.com/'
license=('APACHE')
depends=('sh'
         'java-runtime>=8')
source=("https://github.com/varabyte/kobweb/releases/download/cli-v${pkgver}/${pkgname}-${pkgver}.tar"
        "${pkgname}")
sha256sums=('29c250205be745febeece195a738723c6fdd8ed58e6a777227e3fb8ea353f6a0'
            'cd36e61015c81803efc978d4ec659b44d505b520a056802e7e194c2b0c28f77a')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/lib/"* -t "$pkgdir/usr/share/java/kobweb/"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
