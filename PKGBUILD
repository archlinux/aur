# Maintainer: Tassos Natsakis <7712382@eipieq.com>

_release='2017'
_short_release="${_release:2:4}"
_service_pack='0'
pkgname="labview-${_release}"
pkgver="SP${_service_pack}"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64') # This will likely work on i686, but I have not tested it.
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
        "file://lvsupport${_release}-vianalyzer-${_short_release}.0.${_service_pack}-f0.x86_64.rpm"
        "file://nicurli-${_short_release}.0.${_service_pack}-f0.x86_64.rpm"
        "file://niexfinder-base-1.0-47.noarch.rpm"
        "file://niexfinder-exe-1.0-47.x86_64.rpm"
        "file://niexfinder-labview-${_release}-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://niexfinder-lib-${_release}-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://nijsonmapi-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nilvcompare-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nilvmerge-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nisslcerts-${_short_release}.0.${_service_pack}-3.0.noarch.rpm"
        "file://nissli-${_short_release}.0.${_service_pack}-f0.x86_64.rpm"
        "file://nisvcloc-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nitdmsi-${_short_release}.0.${_service_pack}-f0.x86_64.rpm"
        "file://LICENSE.txt"
        "file://PATENTS.txt")
sha256sums=('c69a3c6260c2ef56802549a437acca9313a3741f3a271ac619fc5ca96d1a8006'
            '3d8f203c009905174fcfbbbde7e6b0a7f7fd95429befeb724a16635898772d67'
            '0df5b76eee9fae63b24c85e704a700e0cb7a46242d82e490648871259d0057c9'
            'de6797f7cff82d0385863dfc61b7802a7509a6c5b280df6dc132bea19cacf814'
            '10dec078f5f01588f83dfab52ba2b661cce9bc5dbf4c8f0f41441860eab00b12'
            '5d7aa5cf5e0a6ff62a3365e61275f7210b11316f6aa061701bc1a2b1e4526f0b'
            '6dcc42120bb32d9e3f5e8f9f7e9e231b2b5b6229b0e8739368ed6cea2b758f7b'
            'e095102febcf67b007b7e87bd07042d690ea38be7c6160e5d5e580cb7dc29a32'
            '7258801d16be880288cc820c2a86ea7d2135d7d5d181be5e387504edc73ad44c'
            'a86514d6fb35d9c79476da667f0dd60d581204a98bbd23fc52965499cedddea4'
            'c04ffa71314ca740347391fc0d52e99f5847f51c033334970fd789b1b03bc891'
            '3ffb7227a5dde4dd27a5375ceda85c9946f5b1059731f3806fb3ef6b79451c26'
            'ca7964c2f1ee738feda003e79c6d2bd9130531440813c592c414d2c845ad0185'
            '0a26ec13b59cbf353e0d921aa1e2a71105056c6a373c0f2d5d713a0bf4276c80'
            '52e04e0a2c456193afa44ebb0933c4c6825f4165fbf6bdb9a656cfc17d01bbe6'
            '6988f5c0748217515b205d2bf0efda4028dc7f313345132a633ca6d393629779'
            '2c0215bbaa03efb1c7b4e1fa139c32b6ba7bbb0adfa1a71a2acb6490460b2c9b'
            'c5159881d3fd6ecc45509fd5778a9339c670faba5fb8e473f3ce265a2f011ea4'
            '95efcbd8fdcb3fbf4817fa540124c0c855c3a46bf24f2df06fedd7f5c0792b51'
            '6b8a2cbd92ea4679546ee70f53ed88bd22f378744d7a17195f6507fca0b7de5d'
            '4ab289dfb0c9f336cdaa9f9e7ca07894dc16bb6a1e1f4a0af621cf291b27e9e3'
            'a46af0f937de74a9f764cfcbe974e0dd6cc8f9c56ba18eaa2f85a8d30697deaf'
            '5b615202e453754015ab61a3983da079e4405792c6e7fb74454075f33bfad51f'
            '73c55fae8f9a071d337a02ecc058eb52a275f9b428bb34f9bd439db6fb105bd3')

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
