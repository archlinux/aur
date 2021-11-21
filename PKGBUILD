# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: abenson <adrian.m.benson@gmail.com>
pkgname=gmt-cpt-city
pkgver=2.24
pkgrel=1
pkgdesc="GMT color palettes (*.cpt) from the cpt-city collection"
arch=('any')
url="http://soliton.vm.bytemark.co.uk/pub/cpt-city"
license=('GPL' 'APACHE' 'CCPL' 'custom')
optdepends=('gmt: the Generic Mapping Tools')
source=("http://soliton.vm.bytemark.co.uk/pub/cpt-city/pkg/cpt-city-cpt-${pkgver}.zip")
options=('!strip')
sha512sums=('408838669aceb1114662215b4aaccfe83aabaafe2bff2075f9f7defe1a196183560fcf24c0e9d0098098d768672f85c7600ef652658c4f286141093937934dc6')

package() {
	install -d "${pkgdir}/usr/share/gmt/cpt"
	cp -r cpt-city "${pkgdir}/usr/share/gmt/cpt/cpt-city"
}
# vim: ts=4 sw=4: 
