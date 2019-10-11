# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=ldapadmin
pkgver=1.8.3
pkgrel=1
pkgdesc="Linux port of free Windows LDAP Admin (http://ldapadmin.org), client and administration tool for LDAP directory management."
url='https://github.com/ibv/LDAP-Admin'
arch=('any')
license=('GPL')
depends=('gtk2')
source=("https://github.com/ibv/LDAP-Admin/releases/download/v${pkgver}/LdapAdmin-x86_64.tar.xz")
sha256sums=('b17a1174fc369a6897147ea3f386bc7f9b4c4608d01a3894b3ee946a5de96c1b')

package() {
  install -Dm 755 "${srcdir}/LdapAdmin" "${pkgdir}/usr/bin/LdapAdmin"
}

