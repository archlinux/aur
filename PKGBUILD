# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-desktop-bin
pkgver=9.16
pkgrel=1
pkgdesc='The desktop user interface for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
license=('PostgreSQL')
url='https://www.pgadmin.org/'
depends=("pgadmin4-server" 'xdg-utils' 'python-dbus')
provides=('pgadmin4-desktop')
conflicts=('pgadmin4-desktop')
source=("pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/noble/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_${pkgver}-1.noble_amd64.deb")
#source=("pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/noble/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_${pkgver}_amd64.deb")
sha256sums=('788e18b307449e3165489d5c1a8199526c5c8e9cf57ef5d8c2b86102afa8d695')


package() {
  # Extract package data
  tar -x --zstd -f data.tar.zst -C "${pkgdir}"
}
