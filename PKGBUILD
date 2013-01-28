# Maintainer: Thomas Weischuh <thomas t-8ch de>

pkgname=ubuntu-keyring
pkgver=2012.05.19
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url="http://packages.ubuntu.com/quantal/ubuntu-keyring"
license=('GPL')
depends=('gnupg')

source=("http://mirror.netcologne.de/ubuntu/pool/main/u/ubuntu-keyring/ubuntu-keyring_${pkgver}_all.deb")

build() {
  tar xzvf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}

sha256sums=(315a58b14eec1e9252b2a2e294f2a4be1ccd043adb58bf5b7f56a538843ed504)
