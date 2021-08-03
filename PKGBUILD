# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=20210803
pkgrel=1
pkgdesc='Spanish Fabrica Nacional de Moneda y Timbre (FNMT) certificates'
arch=('any')
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=('ca-certificates-utils')
source=('https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_SHA256.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_FNMT_Usuarios.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Administracion_Publica_SHA256.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Componentes_Informaticos_SHA256.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Unidades_Sellado_Tiempo.cer'

        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM-SS.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo1.cer'
        'https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo2.cer'

        'OCSP_AC_FNMT_Usuarios.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_FNMT_Usuarios'
        'OCSP_AC_Representacion.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Representacion'
        'OCSP_AP.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AP'
        'OCSP_AC_Componentes_Informaticos.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Componentes_Informaticos'
        'OCSP_ACRAIZ_FNMTRCM.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_ACRAIZ_FNMTRCM'

        'qtsa.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qtsa'
        'tsa.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/tsa'

#         'https://www.sede.fnmt.gob.es/documents/10445900/10526749/FNMTClase2CA.cer'
        )
sha256sums=('ebc5570c29018c4d67b1aa127baf12f703b4611ebc17b7dab5573894179b93fa'
            '601293ca20b09a03295d196256c6953ff9eba811db8e3ce140413c1bffe9a869'
            '8fd16a179944d5d1d420af09405eda7abf2a9c742883e8c2f89e0d90afaf754b'
            '830ff205ae69485059c3fb2376a7f2f9ee1c2a61de259dd09d0bb6ad69f88832'
            'f038421f07f20d63a20d3691e5a178ab8459ebe570c1647b7690554ef23876ab'
            '8265756dd5cd8a37ee61e40351288e4b16a89dd248c1ec4eba25aaf161abf498'
            '9ce630b35f8ae2c6419e734ad9d2fa30476dd9e7394b1e93b27f83f776a024ea'
            '554153b13d2cf9ddb753bfbe1a4e0ae08d0aa4187058fe60a2b862b2e4b87bcb'
            '1edb6bd91274882db795bfc514f8aabe10ad955cbccfd3fd5a5b5febb2ce5b68'
            '9ff23cb9387b9e0083bd5aa1954eeddf792890aa8e67cd4d38dd28af4a439ad8'
            '9b6eb70935919f6c988f59bb33e16cbade9e2ad65bbeabb36b56668aeb54b779'
            '49552f5fd0f67be27c62a00980576b594d15058c88be37451b55d7911b7dbecd'
            'd6d1a026461ddb4c25849affe0881f1eea2e67e33e30636b5e0c68bcc3972690'
            'd74ee6a47cb2dae6003288857a2d7d135ba1e21e7eac8d145d8cc96b5a7b280f'
            '01e8ba844ff4c70d8dff2601b5cd80a63bf32dee8f94876c8c216bbf6c0f8b84'
            '5d93e19f26bcdcc9744f3f342a7d09b3d4d11f3e2dfd4c6079821625878be10a'
            'baf597d97d16bc697f8eb2a1e20ce68c08ad11024f9b1f5264271c1525eeb500'

#             '62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
            )

package() {
  install -Dm644 AC_Raiz_FNMT-RCM_SHA256.cer            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Raiz_FNMT-RCM_SHA256.cer"
  install -Dm644 AC_FNMT_Usuarios.cer                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_FNMT_Usuarios.cer"
  install -Dm644 AC_Representacion.cer                  "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Representacion.cer"
  install -Dm644 AC_Administracion_Publica_SHA256.cer   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Administracion_Publica_SHA256.cer"
  install -Dm644 AC_Componentes_Informaticos_SHA256.cer "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Componentes_Informaticos_SHA256.cer"
  install -Dm644 AC_Sector_Publico.cer                  "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Sector_Publico.cer"
  install -Dm644 AC_Unidades_Sellado_Tiempo.cer         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Unidades_Sellado_Tiempo.cer"

  install -Dm644 AC_Raiz_FNMT-RCM-SS.cer                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Raiz_FNMT-RCM-SS.cer"
  install -Dm644 AC_Servidores_Seguros_Tipo1.cer        "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Servidores_Seguros_Tipo1.cer"
  install -Dm644 AC_Servidores_Seguros_Tipo2.cer        "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Servidores_Seguros_Tipo2.cer"

  install -Dm644 OCSP_AC_FNMT_Usuarios.cer              "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_FNMT_Usuarios.cer"
  install -Dm644 OCSP_AC_Representacion.cer             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_Representacion.cer"
  install -Dm644 OCSP_AP.cer                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AP.cer"
  install -Dm644 OCSP_AC_Componentes_Informaticos.cer   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_Componentes_Informaticos.cer"
  install -Dm644 OCSP_ACRAIZ_FNMTRCM.cer                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_ACRAIZ_FNMTRCM.cer"

  install -Dm644 qtsa.cer                               "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/qtsa.cer"
  install -Dm644 tsa.cer                                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/tsa.cer"

#   install -Dm644 FNMTClase2CA.cer                       "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/FNMTClase2CA.cer"
}
