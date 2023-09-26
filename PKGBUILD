# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kangaroo-max-bin
pkgver=3.92.1.230901
pkgrel=2
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_githuburl="https://github.com/dbkangaroo/kangaroo"
license=("custom")
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-max-bin}")
depends=('cairo' 'libadwaita' 'gtksourceview5' 'libgee' 'qrencode' 'libsoup' 'gtk4' 'libxml2' 'uchardet' 'json-glib' 'glibc' 'hiredis' \
    'gdk-pixbuf2' 'hicolor-icon-theme' 'openssl' 'libarchive' 'glib2' 'pango' 'libpanel' 'sqlcipher' 'mariadb-libs' 'postgresql-libs' 'unixodbc')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('e337406c677105c10c62e209e9722e93eeecd99416efbfff72f81cd374dd7c7b'
            '9b138afe817c542df709df8d28140b737a91c0bcdf58f0d120364dfd4334de45')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
}