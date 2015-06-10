# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=buuf-deuce-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Icon theme for KDE4."
arch=('any')
depends=('kdebase-runtime>=4.3.0')
url="http://shirakawasuna.deviantart.com/art/Buuf-Deuce-KDE-1-0-79077805"
license=('LGPL')
source=(http://fc05.deviantart.net/fs71/f/2010/032/0/5/Buuf_Deuce_KDE_1_0_by_Shirakawasuna.zip)
md5sums=('700b717d980f942e873c83e7246f9286')

build() {
  cd ${srcdir}
  tar xvf Buuf_Deuce_for_KDE_1.0.tar
  install -d ${pkgdir}/usr/share/icons/buff
  cp -fR Buuf_Deuce_for_KDE_${pkgver}/* ${pkgdir}/usr/share/icons/buff
}
