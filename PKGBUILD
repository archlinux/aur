# Maintainer: Florian Freund <florian88freund@gmail.com>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# Contributor: Kacper "KocproZ" Stasiuk <kocproz@protonmail.com>
pkgname=teamspeak3-pluginsdk
pkgver=3.3.0
pkgrel=1
sdkversion=23
pkgdesc="Headers for TeamSpeak3 PluginSDK"
arch=('any')
url="https://www.teamspeak.com/"
license=('custom')
source=("https://github.com/TeamSpeak-Systems/ts3client-pluginsdk/archive/${sdkversion}.tar.gz")
sha256sums=('252df4a287249d03564570f282f6ca3e2cc01e79841d49f53d00873b68df80e9')

package() {
  install -d "${pkgdir}/usr/include/teamspeak3/"{,teamlog/,teamspeak/} 
  install -m644 -t "${pkgdir}/usr/include/teamspeak3/" "${srcdir}/ts3client-pluginsdk-${sdkversion}/include/"*.h
  install -m644 -t "${pkgdir}/usr/include/teamspeak3/teamlog/" "${srcdir}/ts3client-pluginsdk-${sdkversion}/include/teamlog/"*.h
  install -m644 -t "${pkgdir}/usr/include/teamspeak3/teamspeak/" "${srcdir}/ts3client-pluginsdk-${sdkversion}/include/teamspeak/"*.h
}
# vim: set expandtab ts=2 sw=2:
