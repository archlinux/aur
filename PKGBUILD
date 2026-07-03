# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="powder"
_pkgname="powder-toy"
pkgname="${_pkgname}-bin"
pkgver=100.0.399
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=(
  'aarch64'
  'x86_64'
)
url="https://powdertoy.co.uk"
_url="https://github.com/The-Powder-Toy/The-Powder-Toy"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'hicolor-icon-theme'
)
provides=(
  "${_pkgname}=${pkgver}"
  "powdertoy=${pkgver}"
  "powdertoy-bin=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  'powdertoy'
  'powdertoy-bin'
)
replaces=(
  'powdertoy-bin'
)

declare -rAg _appstrings=(
  [APPNAME]="The Powder Toy"
  [APPCOMMENT]="Physics sandbox game"
  [APPEXE]="${_pkgname}"
  [APPID]="uk.co.powdertoy.tpt"
  [APPDATA]="The Powder Toy"
  [APPVENDOR]="powdertoy"
  [MANIFEST_DATE]=""
  [DISPLAY_VERSION_MAJOR]="${pkgver%%.*}"
  [DISPLAY_VERSION_MINOR]="$(echo "${pkgver}" | sed 's/^[0-9]*\.\([0-9]*\).*/\1/')"
  [BUILD_NUM]="${pkgver##*.}"
)

_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-${_appstrings[APPEXE]}.6::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.man"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-save.xml::${_url}/raw/refs/tags/v${pkgver}/resources/save.template.xml"
  "${_pkgsrc}-${_appstrings[APPID]}.appdata.xml::${_url}/raw/refs/tags/v${pkgver}/resources/appdata.template.xml"
  "${_pkgsrc}-${_appstrings[APPID]}.desktop::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.template.desktop"
  "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.16x16.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_16.png"
  "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.32x32.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_32.png"
  "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.48x48.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_48.png"
  "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.256x256.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps.png"
  "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_cps.svg"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.16x16.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_16.png"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.32x32.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_32.png"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.48x48.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_48.png"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.256x256.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe.png"
  "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_exe.svg"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-aarch64-linux-gnu"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-x86_64-linux-gnu"
)
sha256sums=('1342b998099809a417ebd2495ce7b870225befe082ca3d19cd5e651f35ffe3d9'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            'fe2e4fd6fae6a203c01f969f5dfcdb87778a9c819093a08eae5575a21f688d16'
            'da5265406beb017319b749faa8081ac44de55d4b96a499dd8953aefa0b08326e'
            'b8b1e08fc29cdc6d2f325019d9d8e24e06111cd7ed88e7e48cbaed525c299f94'
            'ea5488c6696160c7675c660f7b502a6adf7a49140481d261346206a873c23417'
            'b42d403733b47d0f806cf9952db97a8c18dee5cf108e3bb26ffef62b8f7bb093'
            'a5b0da317348275aa42728de03e6b006d1992e5023d03cb740a7175996c56912'
            '1425b43d1772d6c1c54a341fbe2d94d9f86d691d40ac7a077f5ef3ff3c03bf86'
            '16abd843be88928340969948ff44257b597e6f5506d13668fbd55db52d76b607'
            '0d7544bba851b2228465c947ef2c417bbf34bb02c25ef2b60e0c2c8575aa5791'
            '26fea33bd84a7b3c6846567eff7996a1e96470d4083ca2de6467753cc971790a'
            '97afd3c283cc8847e3f35efe6011bf9eb969ccd8ffde331728ed7b6d9d3d1762'
            'e21498e46a3f1642b5d378ee0e63a3eb6f930778a04a25062ca8c781eab4c314'
            '7f4e5eaff3a84ad3973cc2d7aa0b0d8817559a500aecff84decc7a06357c11b3'
            'da002be13501b7d2ef0d0d470f35bc37d6f90805a7f084a00aa66f7c37ce2f81')
sha256sums_aarch64=('c3bbf1b86847624bed0be8e61014f0a0861bbabecf8eddcf4483196b1496419c')
sha256sums_x86_64=('68bbf771629d03c94d948b9169e0d7221d6597c3aecdb7229d1a9d3667cc3886')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgsrc}-${_appstrings[APPEXE]}.6" \
    "${pkgdir}/usr/share/man/man6/${_appstrings[APPEXE]}.6"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-save.xml" \
    "${pkgdir}/usr/share/mime/packages/${_appstrings[APPVENDOR]}-save.xml"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPID]}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${_appstrings[APPID]}.appdata.xml"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPID]}.desktop" \
    "${pkgdir}/usr/share/applications/${_appstrings[APPID]}.desktop"
  install -vDm644 "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.${_appstrings[APPVENDOR]}.save.svg"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg"

  for _size in 16 32 48 256; do
    install -vDm644 "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/mimetypes/application-vnd.${_appstrings[APPVENDOR]}.save.png"
    install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.png"
  done

  find "${pkgdir}/usr/share" -type f -exec \
    sed -e "s/@APPNAME@/${_appstrings[APPNAME]}/g" \
        -e "s/@APPCOMMENT@/${_appstrings[APPCOMMENT]}/g" \
        -e "s/@APPEXE@/${_appstrings[APPEXE]}/g" \
        -e "s/@APPID@/${_appstrings[APPID]}/g" \
        -e "s/@APPDATA@/${_appstrings[APPDATA]}/g" \
        -e "s/@APPVENDOR@/${_appstrings[APPVENDOR]}/g" \
        -e "s/@MANIFEST_DATE@/${_appstrings[MANIFEST_DATE]}/g" \
        -e "s/@DISPLAY_VERSION_MAJOR@/${_appstrings[DISPLAY_VERSION_MAJOR]}/g" \
        -e "s/@DISPLAY_VERSION_MINOR@/${_appstrings[DISPLAY_VERSION_MINOR]}/g" \
        -e "s/@BUILD_NUM@/${_appstrings[BUILD_NUM]}/g" \
        -i "{}" +
}
