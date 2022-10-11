# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor: Alexander Björk <bjorkalx@protonmail.com>

pkgname="redact"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.16.5"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://update-desktop.redact.dev/build/Redact-${pkgver}.zip")
sha256sums=('b276c8532ed2239eccfb64fb2e7dcf99374bff4f584329c5a2576797438a319d')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/redact ${pkgdir}/usr/bin/redact
}
