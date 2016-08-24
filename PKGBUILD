# Maintainer: dreieck

_pkgname=idos-timetable-tariff-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_8_22
pkgrel=1
pkgdesc="Tariff data for the timetable search engines by CHAPS: Czech/Slovak trains + bus, Czech public transport. Note that some data need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatar"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         # "idos-timetable-data"
         "idos-timetable-data-chaps-all"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-tariff=${pkgver}"
  
  "idos-timetable-tariff-trains-cz=${pkgver}"
  "idos-timetable-tariff-trains-sk=${pkgver}"
  "idos-timetable-tariff-bus-cz=${pkgver}"
  "idos-timetable-tariff-bus-sk=${pkgver}"
  "idos-timetable-tariff-bus-ODIS=${pkgver}"
  "idos-timetable-tariff-MHD-As=${pkgver}"
  "idos-timetable-tariff-MHD-Benesov=${pkgver}"
  "idos-timetable-tariff-MHD-Beroun=${pkgver}"
  "idos-timetable-tariff-MHD-Bilina=${pkgver}"
  "idos-timetable-tariff-MHD-IDSJMK=${pkgver}"
  "idos-timetable-tariff-MHD-Bruntal=${pkgver}"
  "idos-timetable-tariff-MHD-Breclav=${pkgver}"
  "idos-timetable-tariff-MHD-BystriceNP=${pkgver}"
  "idos-timetable-tariff-MHD-Caslav=${pkgver}"
  "idos-timetable-tariff-MHD-CeskaLipa=${pkgver}"
  "idos-timetable-tariff-MHD-CeskyTesin=${pkgver}"
  "idos-timetable-tariff-MHD-Dacice=${pkgver}"
  "idos-timetable-tariff-MHD-Decin=${pkgver}"
  "idos-timetable-tariff-MHD-Domazlice=${pkgver}"
  "idos-timetable-tariff-MHD-Duchcov=${pkgver}"
  "idos-timetable-tariff-MHD-DvurKraloveNL=${pkgver}"
  "idos-timetable-tariff-MHD-FrydekMystek=${pkgver}"
  "idos-timetable-tariff-MHD-HavlickuvBrod=${pkgver}"
  "idos-timetable-tariff-MHD-Havirov=${pkgver}"
  "idos-timetable-tariff-MHD-Horice=${pkgver}"
  "idos-timetable-tariff-MHD-HradecKralove=${pkgver}"
  "idos-timetable-tariff-MHD-Hranice=${pkgver}"
  "idos-timetable-tariff-MHD-IREDO=${pkgver}"
  "idos-timetable-tariff-MHD-Cheb=${pkgver}"
  "idos-timetable-tariff-MHD-Chomutov=${pkgver}"
  "idos-timetable-tariff-MHD-Chrudim=${pkgver}"
  "idos-timetable-tariff-MHD-JabloncecNN=${pkgver}"
  "idos-timetable-tariff-MHD-Jachymov=${pkgver}"
  "idos-timetable-tariff-MHD-Jicin=${pkgver}"
  "idos-timetable-tariff-MHD-Jihlava=${pkgver}"
  "idos-timetable-tariff-MHD-JindrichuvHradec=${pkgver}"
  "idos-timetable-tariff-MHD-Kadan=${pkgver}"
  "idos-timetable-tariff-MHD-KarlovyVary=${pkgver}"
  "idos-timetable-tariff-MHD-Karvina=${pkgver}"
  "idos-timetable-tariff-MHD-Kladno=${pkgver}"
  "idos-timetable-tariff-MHD-KlasterecNO=${pkgver}"
  "idos-timetable-tariff-MHD-Klatovy=${pkgver}"
  "idos-timetable-tariff-MHD-Kolin=${pkgver}"
  "idos-timetable-tariff-MHD-KralupyNV=${pkgver}"
  "idos-timetable-tariff-MHD-Krnov=${pkgver}"
  "idos-timetable-tariff-MHD-Kromeriz=${pkgver}"
  "idos-timetable-tariff-MHD-KutnaHora=${pkgver}"
  "idos-timetable-tariff-MHD-Liberec=${pkgver}"
  "idos-timetable-tariff-MHD-Litomerice=${pkgver}"
  "idos-timetable-tariff-MHD-Litomysl=${pkgver}"
  "idos-timetable-tariff-MHD-Louny=${pkgver}"
  "idos-timetable-tariff-MHD-Lovosice=${pkgver}"
  "idos-timetable-tariff-MHD-MarianskeLazne=${pkgver}"
  "idos-timetable-tariff-MHD-Melnik=${pkgver}"
  "idos-timetable-tariff-MHD-MladaBoleslav=${pkgver}"
  "idos-timetable-tariff-MHD-Most=${pkgver}"
  "idos-timetable-tariff-MHD-Neratovice=${pkgver}"
  "idos-timetable-tariff-MHD-NovyJicin=${pkgver}"
  "idos-timetable-tariff-MHD-Nymburk=${pkgver}"
  "idos-timetable-tariff-MHD-Olomouc=${pkgver}"
  "idos-timetable-tariff-MHD-Opava=${pkgver}"
  "idos-timetable-tariff-MHD-Orlova=${pkgver}"
  "idos-timetable-tariff-MHD-ODIS=${pkgver}"
  "idos-timetable-tariff-MHD-Ostrov=${pkgver}"
  "idos-timetable-tariff-MHD-Pelhrim=${pkgver}"
  "idos-timetable-tariff-MHD-Pisek=${pkgver}"
  "idos-timetable-tariff-MHD-Plzen=${pkgver}"
  "idos-timetable-tariff-MHD-Policka=${pkgver}"
  "idos-timetable-tariff-MHD-PID=${pkgver}"
  "idos-timetable-tariff-MHD-Prostej=${pkgver}"
  "idos-timetable-tariff-MHD-Prelouc=${pkgver}"
  "idos-timetable-tariff-MHD-Prerov=${pkgver}"
  "idos-timetable-tariff-MHD-Prestice=${pkgver}"
  "idos-timetable-tariff-MHD-Pribram=${pkgver}"
  "idos-timetable-tariff-MHD-Rokycany=${pkgver}"
  "idos-timetable-tariff-MHD-RoudniceNL=${pkgver}"
  "idos-timetable-tariff-MHD-Slany=${pkgver}"
  "idos-timetable-tariff-MHD-Sokolov=${pkgver}"
  "idos-timetable-tariff-MHD-Strakon=${pkgver}"
  "idos-timetable-tariff-MHD-Stribro=${pkgver}"
  "idos-timetable-tariff-MHD-Studenka=${pkgver}"
  "idos-timetable-tariff-MHD-Sumperk=${pkgver}"
  "idos-timetable-tariff-MHD-Tabor=${pkgver}"
  "idos-timetable-tariff-MHD-Tachov=${pkgver}"
  "idos-timetable-tariff-MHD-TepliceVC=${pkgver}"
  "idos-timetable-tariff-MHD-Trutnov=${pkgver}"
  "idos-timetable-tariff-MHD-Trebic=${pkgver}"
  "idos-timetable-tariff-MHD-Trinec=${pkgver}"
  "idos-timetable-tariff-MHD-Turnov=${pkgver}"
  "idos-timetable-tariff-MHD-UherskeHradiste=${pkgver}"
  "idos-timetable-tariff-MHD-ValasskeMezirici=${pkgver}"
  "idos-timetable-tariff-MHD-Varnsdorf=${pkgver}"
  "idos-timetable-tariff-MHD-VelkeMezirici=${pkgver}"
  "idos-timetable-tariff-MHD-Vlasim=${pkgver}"
  "idos-timetable-tariff-MHD-Vsetin=${pkgver}"
  "idos-timetable-tariff-MHD-ZabrehNM=${pkgver}"
  "idos-timetable-tariff-MHD-Zlin=${pkgver}"
  "idos-timetable-tariff-MHD-Znojmo=${pkgver}"
  "idos-timetable-tariff-MHD-Zamberk=${pkgver}"
  "idos-timetable-tariff-MHD-Zatec=${pkgver}"
  "idos-timetable-tariff-MHD-ZdarNS=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

source=(
  "komplet_p.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET_P.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET_P.ZIP\(.*\)Zip/KOMPLET_P.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
