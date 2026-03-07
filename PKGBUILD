# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-desktop-bin
pkgver=9.13
pkgrel=1
pkgdesc='The desktop user interface for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
license=('PostgreSQL')
url='https://www.pgadmin.org/'
depends=("pgadmin4-server" 'xdg-utils' 'python-dbus')
provides=('pgadmin4-desktop')
conflicts=('pgadmin4-desktop')
source=("pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/plucky/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_${pkgver}-1.plucky_amd64.deb")
#source=("pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/plucky/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_${pkgver}_amd64.deb")
sha256sums=('24f17c6eb6c5f92e693f02ae505348368fed934ecf88da367e9b2d8b02b16ec2')


package() {
  # Extract package data
  tar -x --zstd -f data.tar.zst -C "${pkgdir}"
}
