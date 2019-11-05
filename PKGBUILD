# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: Tassos Natsakis <7712382@eipieq.com>

_release='2018'
_short_release="${_release:2:4}"
_service_pack='1'
pkgname="labview-${_release}"
pkgver="SP${_service_pack}"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64')
license=("custom:LabVIEW-${_release}")
depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
makedepends=('sed' 'libarchive')
options=('!strip') # Avoid time consuming operations.
PKGEXT='.pkg.tar' # Do not compress, it's a large package (~1GB).
source=("file://labview-${_release}-appbuild-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-core-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-desktop-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-examples-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-exe-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-help-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-pro-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-ref-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-rte-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://lvsupport${_release}-vianalyzer-${_short_release}.0.0-f0.x86_64.rpm"
        "file://nicurli-${_short_release}.0.0-f0.x86_64.rpm"
        "file://niexfinder-base-1.0-49.noarch.rpm"
        "file://niexfinder-exe-1.0-49.x86_64.rpm"
        "file://niexfinder-labview-${_release}-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://niexfinder-lib-${_release}-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://nijsonmapi-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nilvcli-1.1.0.49154-f2.x86_64.rpm"
        "file://nilvcompare-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nilvmerge-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nipythoninterfacei-${_short_release}.0.0.49152-f0.x86_64.rpm"
        "file://nisslcerts-${_short_release}.0.0-3.0.noarch.rpm"
        "file://nissli-${_short_release}.0.0-f0.x86_64.rpm"
        "file://nisvcloc-${_short_release}.0.0-1.noarch.rpm"
        "file://nitdmsi-${_short_release}.0.0.49152-f0.x86_64.rpm"
        "file://LICENSE.txt"
        "file://PATENTS.txt")
sha256sums=('eec5de6e3a1065e6a231888f7fb2a062a090594fd52e9e23c4375a72d8bbf1f0'
            '2a672c135434257db9efc00b85f615d5b2ee95b0caf583f8f6857acde9ad6e9d'
            'c7f3d180d51ad617d0db887b0b376d100a6ff53d43b9beeb1caba7ae67cac554'
            'efd7056dd3129d1f820b8683c36cdc53fc7501fe4efdcbce2eb98a7d933e7d68'
            'acaa312a602a3c7b911c2fe6b2b944f07e731f91871bf172988d15adc97e8f5b'
            '9bdb0e55ca6f8e515d069ac1c6284f8389be296ba99ac20beccac446c6f1ca71'
            '896f04fb5916cfc9d366f22a5cb93bc7fd63fcad6f9d6f468076a77fb1855c6c'
            '435bfde270fef32217f32512c20206f01ed88d17f70ae9656c9cb571846d7ac4'
            '5a6f9cadff3b36abf5d75fbf783a6aa23cdef9db146f321b60314160f4eaea71'
            'e47a6ef1b230ac888199bec13a7fc3917cc9ad4fdb93abf1a025667986ca6b1f'
            '0a6997b9c2352488fe73444dc4dc6cac9674f78b868e206f77bbdd68bcb99401'
            '037d5a3b9e6bc5950d3a7b29cc1d227ff289d68405695d84373d497aa032d2d1'
            'dbae79f97af0ef5adfa67a672983c6bb395e45d066f9fe7f1df9feceafe3cb5d'
            '83be6bdb50483824794b1940b8dca719fd7a129d5ccd796264a095eeba645d6e'
            'be245696359673e81531e554998c0c61870d2b4064e956590fd7e74787336857'
            '4a9ff4374426e304dcae3c6593dfa8631af797f8a7bd77703419c2940840b08b'
            '5bf412c3799dbcc63d95a3606de712cc605b060c0a4e9b4ca24a3205bd1f443e'
            '88f84e2ca58c29fe94d27971a82776499c3e191ff9500c1767491adeea9339ad'
            'a6abb6d784cd952f1264ce9b5fdf45a91b35d62dd1e073995cdcaed4f274f383'
            '359dff0c4c63d2cd29ec7551b8ff3f330a645146bf7a5681701079b7c31daf3c'
            '5c45a42addd32488c145b98ee4c52983215c8ad138eb79bf355aaa3f10ef0bed'
            '1bd0462d6e72df5ef51bd11963aebe0017a11415a391a7cfab1febc834ab64a1'
            'd2ec63634ba9f40a97910b8cadc3c9ce47dea62753ce814f7d973e8898374d18'
            'd8423d91c6840e48ef0158943a24469eded03992ac2f2d52733185456f22f515'
            'a9d79e5fdf281ed0766df6c71319f0f5f32c3e7787e42c8ca0d388d2962f1de6'
            '73c55fae8f9a071d337a02ecc058eb52a275f9b428bb34f9bd439db6fb105bd3')

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
  sed "s,Exec.*,Exec=/opt/natinst/LabVIEW-${_release}-64/labview -launch "%F"," "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/apps/natinst-labview64-${_release}.desktop" > "${pkgdir}/usr/share/applications/natinst-labview-${_release}.desktop"

  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/mime/labview.xml" "${pkgdir}/usr/share/mime/packages"
}

# vim:set et sw=2 sts=2:
