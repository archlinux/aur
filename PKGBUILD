# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=20180411
pkgrel=1
pkgdesc="Spanish Fabrica Nacional de Moneda y Timbre (FNMT) certificates"
arch=('any')
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=('ca-certificates-utils')
source=('https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_SHA256.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/FNMTClase2CA.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_FNMT_Usuarios.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Administracion_Publica_SHA256.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Componentes_Informaticos_SHA256.cer'
        )
sha256sums=('ebc5570c29018c4d67b1aa127baf12f703b4611ebc17b7dab5573894179b93fa'
            '62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
            '601293ca20b09a03295d196256c6953ff9eba811db8e3ce140413c1bffe9a869'
            '830ff205ae69485059c3fb2376a7f2f9ee1c2a61de259dd09d0bb6ad69f88832'
            'f038421f07f20d63a20d3691e5a178ab8459ebe570c1647b7690554ef23876ab'
            )

package() {
  install -Dm644 AC_Raiz_FNMT-RCM_SHA256.cer            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Raiz_FNMT-RCM_SHA256.cer"
  install -Dm644 FNMTClase2CA.cer                       "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/FNMTClase2CA.cer"
  install -Dm644 AC_FNMT_Usuarios.cer                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_FNMT_Usuarios.cer"
  install -Dm644 AC_Administracion_Publica_SHA256.cer   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Administracion_Publica_SHA256.cer"
  install -Dm644 AC_Componentes_Informaticos_SHA256.cer "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Componentes_Informaticos_SHA256.cer"
}
