# Maintainer: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

# If you do not trust the source of installation, you can navigate to
# https://sites.google.com/site/davidtv/ and download from there.
# The MD5 sum provided is for pac-4.5.5.7-all.deb [Nov 4, 2015]

# Thanks to:
# nicebloom
# marties

pkgname=pacmanager-bin
pkgver=4.5.5.7
pkgrel=1
arch=('any')
license=('GPL3')

pkgdesc="Perl Auto Connector PAC Manager"
url="https://sites.google.com/site/davidtv/"

depends=('gconf-perl' 'glade-perl' 'openssh' 'perl-crypt-blowfish' 'perl-gnome2-vte' 'perl-expect' 'perl-crypt-rijndael' 'perl-gtk2-ex-simple-list' 'perl-io-stty' 'perl-io-tty' 'perl-net-arp' 'perl-yaml' 'perl-crypt-cbc' 'perl-gtk2-unique' 'perl-socket6' 'uuid')
source=("https://contini.info/files/pac-${pkgver}-all.deb")
md5sums=('814be8e0e5bafb91bea034f21ac4317c')


package() {
    tar -C "${pkgdir}" -xvJf "${srcdir}/data.tar.xz"
}
