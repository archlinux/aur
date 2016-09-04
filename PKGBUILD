# Maintainer: dreieck

_pkgname=idos-timetable-data-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_9_2
pkgrel=1
pkgdesc="Timetable data for the timetable search engines by CHAPS: European railway, Czech/Slovak trains + bus, Czech public transport, some air transport. Note that some timetables need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatt"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-common"
        )

makedepends=(
  "wget"
)

optdepends=(
            "idos-timetable-tariff: For showing prices."
            "idos-timetable-maps: For displaying routes on maps."
            "idos-timetable-additionalinfo-trains: For (links to) additional information about train composition and stations."
            "idos-timetable-additionalinfo-bus: For images of certain bus stations."
            "idos-timetable-additionalinfo-mhd-idsjmk: For photographs of public transport stops in the IDSJMK region."
            "idos-timetable-additionalinfo-mhd-pid: For photographs of public transport stops in the PID region."
            "idos-timetable-additionalinfo-mhd-odis: For links to information about changes, fares, salespoints ... in the ODIS-region."
           )

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"
  "idos-timetable-data-bus=${pkgver}"
  "idos-timetable-data-mhd=${pkgver}"
  "idos-timetable-data-flights=${pkgver}"
  
  "idos-timetable-data-trains-cz=${pkgver}"
  "idos-timetable-data-trains-europe=${pkgver}"
  "idos-timetable-data-trains-idol=${pkgver}"
  "idos-timetable-data-trains-odis=${pkgver}"
  "idos-timetable-data-trains-pid=${pkgver}"
  "idos-timetable-data-bus-cz=${pkgver}"
  "idos-timetable-data-bus-cz-history=${pkgver}"
  "idos-timetable-data-bus-sk=${pkgver}"
  "idos-timetable-data-bus-idol=${pkgver}"
  "idos-timetable-data-bus-odis=${pkgver}"
  "idos-timetable-data-mhd-adamov=${pkgver}"
  "idos-timetable-data-mhd-as=${pkgver}"
  "idos-timetable-data-mhd-benesov=${pkgver}"
  "idos-timetable-data-mhd-beroun=${pkgver}"
  "idos-timetable-data-mhd-bilina=${pkgver}"
  "idos-timetable-data-mhd-blansko=${pkgver}"
  "idos-timetable-data-mhd-brandysnl=${pkgver}"
  "idos-timetable-data-mhd-idsjmk=${pkgver}"
  "idos-timetable-data-mhd-bruntal=${pkgver}"
  "idos-timetable-data-mhd-breclav=${pkgver}"
  "idos-timetable-data-mhd-bystricenp=${pkgver}"
  "idos-timetable-data-mhd-caslav=${pkgver}"
  "idos-timetable-data-mhd-ceskalipa=${pkgver}"
  "idos-timetable-data-mhd-ceskebudejovice=${pkgver}"
  "idos-timetable-data-mhd-ceskytesin=${pkgver}"
  "idos-timetable-data-mhd-dacice=${pkgver}"
  "idos-timetable-data-mhd-decin=${pkgver}"
  "idos-timetable-data-mhd-domazlice=${pkgver}"
  "idos-timetable-data-mhd-duchcov=${pkgver}"
  "idos-timetable-data-mhd-dvurkralovenl=${pkgver}"
  "idos-timetable-data-mhd-frydekmystek=${pkgver}"
  "idos-timetable-data-mhd-havirov=${pkgver}"
  "idos-timetable-data-mhd-havlickuvbrod=${pkgver}"
  "idos-timetable-data-mhd-hodonin=${pkgver}"
  "idos-timetable-data-mhd-horice=${pkgver}"
  "idos-timetable-data-mhd-hradeckralove=${pkgver}"
  "idos-timetable-data-mhd-hranice=${pkgver}"
  "idos-timetable-data-mhd-cheb=${pkgver}"
  "idos-timetable-data-mhd-chomutov=${pkgver}"
  "idos-timetable-data-mhd-chrudim=${pkgver}"
  "idos-timetable-data-mhd-jabloncecnn=${pkgver}"
  "idos-timetable-data-mhd-jachymov=${pkgver}"
  "idos-timetable-data-mhd-jicin=${pkgver}"
  "idos-timetable-data-mhd-jihlava=${pkgver}"
  "idos-timetable-data-mhd-jindrichuvhradec=${pkgver}"
  "idos-timetable-data-mhd-kadan=${pkgver}"
  "idos-timetable-data-mhd-karlovyvary=${pkgver}"
  "idos-timetable-data-mhd-karvina=${pkgver}"
  "idos-timetable-data-mhd-kladno=${pkgver}"
  "idos-timetable-data-mhd-klasterecno=${pkgver}"
  "idos-timetable-data-mhd-klatovy=${pkgver}"
  "idos-timetable-data-mhd-kolin=${pkgver}"
  "idos-timetable-data-mhd-kostelecno=${pkgver}"
  "idos-timetable-data-mhd-kralupynv=${pkgver}"
  "idos-timetable-data-mhd-krnov=${pkgver}"
  "idos-timetable-data-mhd-kromeriz=${pkgver}"
  "idos-timetable-data-mhd-kutnahora=${pkgver}"
  "idos-timetable-data-mhd-kyjov=${pkgver}"
  "idos-timetable-data-mhd-liberec=${pkgver}"
  "idos-timetable-data-mhd-litomerice=${pkgver}"
  "idos-timetable-data-mhd-litomysl=${pkgver}"
  "idos-timetable-data-mhd-louny=${pkgver}"
  "idos-timetable-data-mhd-lovosice=${pkgver}"
  "idos-timetable-data-mhd-marianskelazne=${pkgver}"
  "idos-timetable-data-mhd-melnik=${pkgver}"
  "idos-timetable-data-mhd-milevsko=${pkgver}"
  "idos-timetable-data-mhd-mladaboleslav=${pkgver}"
  "idos-timetable-data-mhd-mnisekpb=${pkgver}"
  "idos-timetable-data-mhd-most=${pkgver}"
  "idos-timetable-data-mhd-nachod=${pkgver}"
  "idos-timetable-data-mhd-neratovice=${pkgver}"
  "idos-timetable-data-mhd-novemestonm=${pkgver}"
  "idos-timetable-data-mhd-novyjicin=${pkgver}"
  "idos-timetable-data-mhd-nymburk=${pkgver}"
  "idos-timetable-data-mhd-olomouc=${pkgver}"
  "idos-timetable-data-mhd-opava=${pkgver}"
  "idos-timetable-data-mhd-orlova=${pkgver}"
  "idos-timetable-data-mhd-odis=${pkgver}"
  "idos-timetable-data-mhd-ostrov=${pkgver}"
  "idos-timetable-data-mhd-pardubice=${pkgver}"
  "idos-timetable-data-mhd-pelhrim=${pkgver}"
  "idos-timetable-data-mhd-pisek=${pkgver}"
  "idos-timetable-data-mhd-plzen=${pkgver}"
  "idos-timetable-data-mhd-policka=${pkgver}"
  "idos-timetable-data-mhd-pid=${pkgver}"
  "idos-timetable-data-mhd-prostej=${pkgver}"
  "idos-timetable-data-mhd-prelouc=${pkgver}"
  "idos-timetable-data-mhd-prerov=${pkgver}"
  "idos-timetable-data-mhd-prestice=${pkgver}"
  "idos-timetable-data-mhd-pribram=${pkgver}"
  "idos-timetable-data-mhd-rokycany=${pkgver}"
  "idos-timetable-data-mhd-roudnicenl=${pkgver}"
  "idos-timetable-data-mhd-rychnovnk=${pkgver}"
  "idos-timetable-data-mhd-slany=${pkgver}"
  "idos-timetable-data-mhd-sokolov=${pkgver}"
  "idos-timetable-data-mhd-strakon=${pkgver}"
  "idos-timetable-data-mhd-stribro=${pkgver}"
  "idos-timetable-data-mhd-studenka=${pkgver}"
  "idos-timetable-data-mhd-spindleruvmlyn=${pkgver}"
  "idos-timetable-data-mhd-steti=${pkgver}"
  "idos-timetable-data-mhd-sumperk=${pkgver}"
  "idos-timetable-data-mhd-tabor=${pkgver}"
  "idos-timetable-data-mhd-tachov=${pkgver}"
  "idos-timetable-data-mhd-teplicevc=${pkgver}"
  "idos-timetable-data-mhd-trutnov=${pkgver}"
  "idos-timetable-data-mhd-trebic=${pkgver}"
  "idos-timetable-data-mhd-trinec=${pkgver}"
  "idos-timetable-data-mhd-turnov=${pkgver}"
  "idos-timetable-data-mhd-tynisteno=${pkgver}"
  "idos-timetable-data-mhd-uherskehradiste=${pkgver}"
  "idos-timetable-data-mhd-ustinl=${pkgver}"
  "idos-timetable-data-mhd-valasskemezirici=${pkgver}"
  "idos-timetable-data-mhd-varnsdorf=${pkgver}"
  "idos-timetable-data-mhd-velkemezirici=${pkgver}"
  "idos-timetable-data-mhd-vimperk=${pkgver}"
  "idos-timetable-data-mhd-vlasim=${pkgver}"
  "idos-timetable-data-mhd-vrchlabi=${pkgver}"
  "idos-timetable-data-mhd-vsetin=${pkgver}"
  "idos-timetable-data-mhd-vyskov=${pkgver}"
  "idos-timetable-data-mhd-zabrehnm=${pkgver}"
  "idos-timetable-data-mhd-zlin=${pkgver}"
  "idos-timetable-data-mhd-znojmo=${pkgver}"
  "idos-timetable-data-mhd-zamberk=${pkgver}"
  "idos-timetable-data-mhd-zatec=${pkgver}"
  "idos-timetable-data-mhd-zdarns=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-data-chaps-trains"
  "idos-timetable-data-chaps-trains-cz"
  "idos-timetable-data-chaps-trains-europe"
  "idos-timetable-data-chaps-bus"
  "idos-timetable-data-chaps-mhd"
  "idos-timetable-data-chaps-flights"
)

source=(
  "komplet.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET.ZIP\(.*\)Zip/KOMPLET.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*
  rm -f "${_instdir}/Data1"/[vV][lL][aA][kK].[tT][tT][rR] # This one is provided by idos-timetable-data-trains-common.

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
