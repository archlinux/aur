# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=2034

pkgname=ttf-windows
pkgver=1
pkgrel=1
pkgdesc='Calibri, Consolas, and Segoe UI'
url='https://github.com/martinring/clide/tree/master/doc/fonts'
arch=('any')
license=('none')
source=('https://github.com/martinring/clide/raw/master/doc/fonts/calibri.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/calibrib.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/calibrii.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/consola.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/consolab.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/consolai.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/consolaz.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeui.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeuib.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeuii.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeuil.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeuisl.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/segoeuiz.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/seguili.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/seguisb.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/seguisbi.ttf'
        'https://github.com/martinring/clide/raw/master/doc/fonts/seguisli.ttf')
sha256sums=('6cc4055abce8101cfa3850031df0cc226341618d4361e23a7bc4d5f2ebb2807f'
            '009a5e879d37d75e8922a2786e64e7ee197762111f45ac0564262aa1d8f6f81e'
            'f09ea6e6c951fa17dd8b0ed4d68686c977eddfa616f5efc617efd0ad123c4cc9'
            '2fb90b43b7583971b38df935e28c3250fc281cc84d2e807b216e2ef07b05f975'
            'd38458ec34f1568e66565cc260e35da1383023f6052f8cc0ca2a50a1cb9cdf63'
            'd0e2af3c6a783d2ea396a5486e5d16d74e2adfcd14a29c337c950b7b2b51c98c'
            'e790812a7ea5dd6255973a0a2456054a7ce1f549c28ff89da4727971decfa494'
            '13623a0ac051b0e08fa142a13cb6e5ef43d9d34c220efac7c210ff670a242925'
            'dac3156acb4136c47484e8e16b65b275b4109346c09e076fa72aad212cff337d'
            '7ab7d07b58d25ca037fff4df64ee7043e91c12cfff0716a9298c507a2648c422'
            '0324c9a66df0dcac782c1022dd2a88134550ff9c8832f14216faffe3df180151'
            'b1fda74a72733dde77a9b1837f1a96dae29079366a069cc0785dcdaa5aacc3c4'
            'd756572d10ab716a53cb30e9a14631a64340e556d7a1c62f7f89ed526c37f899'
			'67e2c30f90d96ed45998917eb8c3c7577fa70dd468fae54c13d1771961fa0b8e'
			'd1f97c7320e56280cf7bcb25db04102883cd4349f762c5009c3004f6d3fd47b4'
			'b637e1d88370f6c166384e84b83decd875189db296aa5b5f9454a0af289ff9ea'
			'086e2726b9c4a8c1189d67c429459ba57fcbb2a0240cdacc7bdd0e80affc6de9')

package() {
	# shellcheck disable=2154
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/
	# shellcheck disable=2154
	install -D -m0644 "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
