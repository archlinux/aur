# Contributor: Shalygin Konstantin <k0ste@cn.ru>

pkgname='pidgin-save-conversations'
pkgver='0.2'
pkgrel='2'
pkgdesc='Crossplatform plugin for Pidgin messenger that saves your opened conversations at shutdown and restores its at startup'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/save-convs'
license=('GPL')
depends=('pidgin' 'perl')
source=("${url}/files/save-convs/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=("ebb7caf30dad9e507e95396b67f316b94518dafb0408ae654c9528872bf2ca7f")

package() {
  pushd "${srcdir}"
  install -Dm644 "save-conversations.pl" "${pkgdir}/usr/lib/pidgin/save-conversations.pl"
  popd
}
