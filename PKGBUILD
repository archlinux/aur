# Maintainer: Daniele Olivieri <danieledaniele1988@gmail.com>
# Contributor: Ilya Elenskiy
# Contributor: Oystein Sture <oysstu@gmail.com>
# Contributor: Tassos Natsakis <7712382@eipieq.com>

_release='2022'
_short_release="${_release:2:4}.3"
_service_pack='49363-0+f211'
pkgname="labview-${_release}"
pkgver="1"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/it-it/support/downloads/software-products/download/unpackaged-linux.labview.460677.html"
arch=('x86_64')
license=("custom:LabVIEW-${_release}")
depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
makedepends=('sed' 'libarchive')
options=('!strip') # Avoid time consuming operations.
source=("file://labview-${_release}-exe-libs-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://labview-${_release}-profull-exe-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://labview-${_release}-rte-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-avahi-client-22.5.0.49216-0+f64.x86_64.rpm"
"file://ni-curl-bin-21.3.0.49152-0+f0.x86_64.rpm"
"file://nicurli-21.3.0.49152-0+f0.noarch.rpm"
"file://ni-euladepot-22.5.0.49285-0+f133.noarch.rpm"
"file://ni-example-finder-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-example-finder-base-${_short_release}.0.${_service_pack}.noarch.rpm"
"file://ni-help-launcher-22.5.0.49176-0+f24.noarch.rpm"
"file://ni-help-preferences-22.5.0.49178-0+f26.x86_64.rpm"
"file://nijsonmapi-21.0.0.49152-0+f0.noarch.rpm"
"file://ni-labview-${_release}-core-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-${_release}-desktop-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-${_release}-example-finder-${_short_release}.0.${_service_pack}.noarch.rpm"
"file://ni-labview-${_release}-example-finder-lib-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-${_release}-examples-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-${_release}-full-${_short_release}.0.${_service_pack}.noarch.rpm"
"file://ni-labview-${_release}-help-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-${_release}-ref-${_short_release}.0.${_service_pack}.x86_64.rpm"
"file://ni-labview-command-line-interface-${_short_release}.0.49247-0+f95.x86_64.rpm"
"file://ni-labview-offline-manual-${_short_release}.0.49365-0+f213.x86_64.rpm"
"file://ni-networkdiscoverysvc-22.5.0.49218-0+f66.x86_64.rpm"
"file://ni-offline-help-viewer-1.8.0.x86_64.rpm"
"file://ni-python-interface-${_short_release}.0.49250-0+f98.x86_64.rpm"
"file://ni-service-locator-${_short_release}.0.49294-0+f142.x86_64.rpm"
"file://ni-software-action-services-22.5.0.49218-0+f66.x86_64.rpm"
"file://ni-ssl-bin-21.3.0.49152-0+f0.x86_64.rpm"
"file://nisslcerts-21.3.0.49152-0+f0.noarch.rpm"
"file://nissli-21.3.0.49152-0+f0.noarch.rpm"
"file://ni-sysapi-22.5.0.49218-0+f66.x86_64.rpm"
"file://ni-syscfg-labview-support-22.5.0.49218-0+f66.x86_64.rpm"
"file://ni-syscfg-runtime-22.5.0.49218-0+f66.x86_64.rpm"
"file://ni-targetcfg-22.5.0.49215-0+f63.x86_64.rpm"
"file://ni-tdms-bin-${_short_release}.0.49246-0+f94.x86_64.rpm"
"file://nitdmsi-${_short_release}.0.49246-0+f94.noarch.rpm"
        "file://LICENSE.txt"
        "file://PATENTS.txt"
        )
sha256sums=('8771774a0f1bf18a30af1a974f01187b4f5deb7b8639f0d988d6af0b668d5e80'
'7e3a10e203f3dca677fe950f3457e7c77fcf83645287dd7d13b565c67078a80f'
'4ce576cd621ba54bcbb7427f1017e89a2556309c3e527cd2266e54c7e41ec4b1'
'2d4eae8c5c5ae0dcad0845ce6f120a8ba914c0d4a5850313e2cd3d7dd59b85e2'
'4e51629863a81a15a6625497734cfc524a0c3826e9dbde6701a049275166367d'
'5a50116b3342f830482ad77bdd7a20c78a47424856a6a86cb9d597e800e973c3'
'5d1a9d6d74ac457605643f02e0cfee7d3a7d6246675f2e67a1129b1d15be334e'
'23847da7b851afb3f8782b7995cab955022b1e58a1394018f24a953eb4385dee'
'f12946b01adf689aa2c4ad1ad4ecf0a283299c0f94b5aecbceb93d85a0527083'
'55d201e00f53931c1cdd1b9ee095293064d2ffe1cefd4c8aa79a475aef440e6e'
'3c8b88e68df8caeb54e8cf5cdd1a0dfe8c89037a5b582fec4797508e8d40fe66'
'bf00f4c455aa4280aa7aab54b065ad1ea83ec7d5dd9b3435f59fe47605a79bab'
'28826aaef0f73c1d0025ec94ad2ccbe2e2beda788ec63edd3d3ab92cd1a9b2d6'
'd03038caf5ccfc9aef855e5fcf9701cc5370918ef4cbe1802d05b086d57db6f2'
'803f787b6d5438ca5f4605067cd882a1f7e69bf441449c39e5a327bab218f141'
'43765b0276f7b3dd7d5df9e51b1447113cc96e8dfb8220f37df415b177dbf4f8'
'0fa14a71aa369e58d8d9acde0ee490e559693e3fac9ccd64f1e8f5a32aea4946'
'41cd3ded35c3b716fa2523774e7368a796176f64a3dc15c94074aaf567369573'
'793e01f0621b8cab29dcf3a09388cc9efa40691074640688126c8c592b1c4a6f'
'8367a5d0eb6ad796654c1c17a6d150f60d051d37b61972ff5da9f3cbb4e655b2'
'5fd7bb5fdd8a45a94d7f84fa4fdb40c4a91b04505c09d82ca991a297b577f1b1'
'6bbeb11beffd73b4a6f5710ee6c80705a3a3d12dea5f67470d2d08ef8f794219'
'cf2b1dda203b2d8c96e7961ed4fe93d8251dacb9847deec3038746f2c8768733'
'981f33cb0362ea5e1202d9b1790654f7688b2e6c034c187cd3f1b79ca14901bf'
'55244cdf0b8df48907fb5d61b435aae953484780b66963a61cb44fb42d44a7ee'
'd8b0fbf5d74c00b2a50bd46fed6fc459eed0b519fd2643a6b730efa6d277e09c'
'8169a197fca62b1a20d054ee6d7080664168798b1b2100faf613a34b8ab5f23a'
'555da576b2ac37094a3e95257370cd4763f83962e6388885a3605c09293ba8b5'
'b4e2361f893b2e1b99b454739ccf721818c62ba9d7e55d72d9bcc43a8ad9cda4'
'0557e56ed1f62253620146461bc48602dcdbd9edc4a31e93c3ec348753568f96'
'777b917b7aa2af69d7a94c3bb3ce594ad7583e75b602e337b13dfc383cd4e34f'
'e5d851fd99c03287d42b500cef840c329d391006136fd20098dc3995702589f8'
'd781d769fc0af761b7568fcedc555193e1c92fd806260b9db2163df019517ddf'
'6400d9d63e0f67f6c4c738cd8c6e0241732969f8e8422dd3862a51a2fa8fb3c5'
'010a3b94ead30354bec9f93ed49e0480d30b6493ba52bbc1977014b37ed8a741'
'f1d3ebe100651f1c31a6708cfe9d54c66b1f979b321b2072ec7c8877d2d15068'
'a4886a8787b81f6f2f7e45309ba11e00039d6de8760720efbc69e6b5ec182c7d'
'e9a390457f6d73628553ab09e7be00c10af680af2a4346ea49fe19ebed03fe70'
)

prepare() {
    cd ${srcdir}
    for file in ${source[@]}; do if [ ${file: -4} == ".rpm" ]; then bsdtar -xf "${file#file://}"; fi; done
}
            
            
package() {
  mkdir -p "${pkgdir}/opt"

  cp -rp "${srcdir}/usr/local/natinst" "${pkgdir}/opt/"
     
  mkdir -p "${pkgdir}/usr/share/licenses/LabVIEW-${_release}"
  cp "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/LICENSE.txt"
  cp "${srcdir}/PATENTS.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/PATENTS.txt"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes"

  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/48x48/labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/48x48/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/natinst-labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/128x128/labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/128x128/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/natinst-labview.png"

  for file in "${pkgdir}"/opt/natinst/LabVIEW-"${_release}-64"/etc/desktop/icons/48x48/application-x-*.png; do
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/
  done

  mkdir -p "${pkgdir}/usr/share/applications"
  sed "s,Exec.*,Exec=/opt/natinst/LabVIEW-${_release}-64/labviewprofull -launch "%F"," "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/apps/natinst-labview64-${_release}.desktop" > "${pkgdir}/usr/share/applications/natinst-labview-${_release}.desktop"

  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/mime/labview.xml" "${pkgdir}/usr/share/mime/packages"
  
  # apply patch 1
 # cp -p "${srcdir}/labview" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
 # cp -rp "${srcdir}/vi.lib" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
 # cp -rp "${srcdir}/AppLibs" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
}

# vim:set et sw=2 sts=2:
