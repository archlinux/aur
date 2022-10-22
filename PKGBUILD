# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: vantu5z <vantu5z@mail.ru>
# Contributor: der_fenix <derfenix@gmail.com>

pkgname=rhvoice-git
pkgver=1.8.0.r73.a4481436
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages. (development version)"
arch=('x86_64')
url="https://github.com/RHVoice/RHVoice"
license=('GPL3' 'custom' 'custom:by-nc-nd-4.0' 'custom:by-sa-4.0')
depends=('libpulse')
makedepends=('git' 'scons' 'speech-dispatcher' 'portaudio' 'libao')
optdepends=('rhvoice-dictionary-git: extended russian dictionary'
            'speech-dispatcher: for speech-dispatcher module support'
            'portaudio: for portaudio backend'
            'libao: for ao backend')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
backup=('etc/RHVoice/RHVoice.conf')
source=(
  "${pkgname%-git}::git+https://github.com/RHVoice/RHVoice.git"
  "${pkgname%-git}-evgeniy-rus::git+https://github.com/rhvoice/evgeniy-rus.git"
  "${pkgname%-git}-victoria-rus::git+https://github.com/rhvoice/victoria-rus.git"
  "${pkgname%-git}-evgeniy-eng::git+https://github.com/rhvoice/evgeniy-eng.git"
  "${pkgname%-git}-lyubov-eng::git+https://github.com/rhvoice/lyubov-eng.git"
  "${pkgname%-git}-volodymyr-ukr::git+https://github.com/rhvoice/volodymyr-ukr.git"
  "${pkgname%-git}-aleksandr-hq-rus::git+https://github.com/rhvoice/aleksandr-hq-rus.git"
  "${pkgname%-git}-yuriy-rus::git+https://github.com/rhvoice/yuriy-rus.git"
  "${pkgname%-git}-marianna-ukr::git+https://github.com/rhvoice/marianna-ukr.git"
  "${pkgname%-git}-tatiana-rus::git+https://github.com/rhvoice/tatiana-rus.git"
  "${pkgname%-git}-Polish::git+https://github.com/RHVoice/Polish.git"
  "${pkgname%-git}-mikhail-rus::git+https://github.com/rhvoice/mikhail-rus.git"
  "${pkgname%-git}-vitaliy-rus::git+https://github.com/rhvoice/vitaliy-rus.git"
  "${pkgname%-git}-magda-pol::git+https://github.com/RHVoice/magda-pol.git"
  "${pkgname%-git}-assert::git+https://github.com/boostorg/assert.git"
  "${pkgname%-git}-core::git+https://github.com/boostorg/core.git"
  "${pkgname%-git}-align::git+https://github.com/boostorg/align.git"
  "${pkgname%-git}-config::git+https://github.com/boostorg/config.git"
  "${pkgname%-git}-container::git+https://github.com/boostorg/container.git"
  "${pkgname%-git}-detail::git+https://github.com/boostorg/detail.git"
  "${pkgname%-git}-io::git+https://github.com/boostorg/io.git"
  "${pkgname%-git}-container_hash::git+https://github.com/boostorg/container_hash.git"
  "${pkgname%-git}-intrusive::git+https://github.com/boostorg/intrusive.git"
  "${pkgname%-git}-mp11::git+https://github.com/boostorg/mp11.git"
  "${pkgname%-git}-integer::git+https://github.com/boostorg/integer.git"
  "${pkgname%-git}-interprocess::git+https://github.com/boostorg/interprocess.git"
  "${pkgname%-git}-move::git+https://github.com/boostorg/move.git"
  "${pkgname%-git}-predef::git+https://github.com/boostorg/predef.git"
  "${pkgname%-git}-throw_exception::git+https://github.com/boostorg/throw_exception.git"
  "${pkgname%-git}-exception::git+https://github.com/boostorg/exception.git"
  "${pkgname%-git}-json::git+https://github.com/boostorg/json.git"
  "${pkgname%-git}-preprocessor::git+https://github.com/boostorg/preprocessor.git"
  "${pkgname%-git}-variant2::git+https://github.com/boostorg/variant2.git"
  "${pkgname%-git}-smart_ptr::git+https://github.com/boostorg/smart_ptr.git"
  "${pkgname%-git}-tokenizer::git+https://github.com/boostorg/tokenizer.git"
  "${pkgname%-git}-system::git+https://github.com/boostorg/system.git"
  "${pkgname%-git}-static_assert::git+https://github.com/boostorg/static_assert.git"
  "${pkgname%-git}-tuple::git+https://github.com/boostorg/tuple.git"
  "${pkgname%-git}-utility::git+https://github.com/boostorg/utility.git"
  "${pkgname%-git}-type_traits::git+https://github.com/boostorg/type_traits.git"
  "${pkgname%-git}-nowide::git+https://github.com/boostorg/nowide.git"
  "${pkgname%-git}-unordered::git+https://github.com/boostorg/unordered.git"
  "${pkgname%-git}-optional::git+https://github.com/boostorg/optional.git"
  "${pkgname%-git}-algorithm::git+https://github.com/boostorg/algorithm.git"
  "${pkgname%-git}-date_time::git+https://github.com/boostorg/date_time.git"
  "${pkgname%-git}-lexical_cast::git+https://github.com/boostorg/lexical_cast.git"
  "${pkgname%-git}-mpl::git+https://github.com/boostorg/mpl.git"
  "${pkgname%-git}-numeric_conversion::git+https://github.com/boostorg/numeric_conversion.git"
  "${pkgname%-git}-iterator::git+https://github.com/boostorg/iterator.git"
  "${pkgname%-git}-natan-pol::git+https://github.com/RHVoice/natan-pol.git"
  "${pkgname%-git}-range::git+https://github.com/boostorg/range.git"
  "${pkgname%-git}-type_index::git+https://github.com/boostorg/type_index.git"
  "${pkgname%-git}-concept_check::git+https://github.com/boostorg/concept_check.git"
  "${pkgname%-git}-bind::git+https://github.com/boostorg/bind.git"
  "${pkgname%-git}-msi::git+https://github.com/RHVoice/msi.git"
  "${pkgname%-git}-Ccache.cmake::git+https://github.com/TheLartians/Ccache.cmake.git"
  "${pkgname%-git}-array::git+https://github.com/boostorg/array.git"
  "${pkgname%-git}-function::git+https://github.com/boostorg/function.git"
  "${pkgname%-git}-Albanian::git+https://github.com/RHVoice/Albanian.git"
  "${pkgname%-git}-Brazilian-Portuguese::git+https://github.com/RHVoice/Brazilian-Portuguese.git"
  "${pkgname%-git}-English::git+https://github.com/RHVoice/English.git"
  "${pkgname%-git}-Georgian::git+https://github.com/RHVoice/Georgian.git"
  "${pkgname%-git}-Macedonian::git+https://github.com/RHVoice/Macedonian.git"
  "${pkgname%-git}-suze-mkd::git+https://github.com/RHVoice/suze-mkd.git"
  "${pkgname%-git}-Russian::git+https://github.com/RHVoice/Russian.git"
  "${pkgname%-git}-Ukrainian::git+https://github.com/RHVoice/Ukrainian.git"
  "${pkgname%-git}-Kyrgyz::git+https://github.com/RHVoice/Kyrgyz.git"
  "${pkgname%-git}-anatol-ukr::git+https://github.com/RHVoice/anatol-ukr.git"
  "${pkgname%-git}-Tatar::git+https://github.com/RHVoice/Tatar.git"
  "${pkgname%-git}-alan-eng::git+https://github.com/RHVoice/alan-eng.git"
  "${pkgname%-git}-aleksandr-rus::git+https://github.com/RHVoice/aleksandr-rus.git"
  "${pkgname%-git}-azamat-kir::git+https://github.com/RHVoice/azamat-kir.git"
  "${pkgname%-git}-clb-eng::git+https://github.com/RHVoice/clb-eng.git"
  "${pkgname%-git}-anna-rus::git+https://github.com/RHVoice/anna-rus.git"
  "${pkgname%-git}-bdl-eng::git+https://github.com/RHVoice/bdl-eng.git"
  "${pkgname%-git}-elena-rus::git+https://github.com/RHVoice/elena-rus.git"
  "${pkgname%-git}-hana-sqi::git+https://github.com/RHVoice/hana-sqi.git"
  "${pkgname%-git}-kiko-mkd::git+https://github.com/RHVoice/kiko-mkd.git"
  "${pkgname%-git}-irina-rus::git+https://github.com/RHVoice/irina-rus.git"
  "${pkgname%-git}-leticia-f123-pt-br::git+https://github.com/RHVoice/leticia-f123-pt-br.git"
  "${pkgname%-git}-natia-kat::git+https://github.com/RHVoice/natia-kat.git"
  "${pkgname%-git}-nazgul-kir::git+https://github.com/RHVoice/nazgul-kir.git"
  "${pkgname%-git}-winapi::git+https://github.com/boostorg/winapi.git"
  "${pkgname%-git}-natalia-ukr::git+https://github.com/RHVoice/natalia-ukr.git"
  "${pkgname%-git}-slt-eng::git+https://github.com/RHVoice/slt-eng.git"
  "${pkgname%-git}-Esperanto::git+https://github.com/RHVoice/Esperanto.git"
  "${pkgname%-git}-talgat-tat::git+https://github.com/RHVoice/talgat-tat.git"
  "${pkgname%-git}-spomenka-epo::git+https://github.com/RHVoice/spomenka-epo.git"
  "${pkgname%-git}-artemiy-rus::git+https://github.com/RHVoice/artemiy-rus.git"
  "${pkgname%-git}-pavel-rus::git+https://github.com/RHVoice/pavel-rus.git"
  "${pkgname%-git}-arina-rus::git+https://github.com/RHVoice/arina-rus.git"
  "${pkgname%-git}-vitaliy-ng-rus::git+https://github.com/rhvoice/vitaliy-ng-rus"
  "${pkgname%-git}-umka-rus::git+https://github.com/rhvoice/umka-rus"
  "${pkgname%-git}-michal-pol::git+https://github.com/RHVoice/michal-pol.git"
  "${pkgname%-git}-alicja-pol::git+https://github.com/RHVoice/alicja-pol.git"
  "${pkgname%-git}-timofey-rus::git+https://github.com/rhvoice/timofey-rus"
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	git submodule init
	git config submodule.external/libs/sonic.active false
	git config submodule.src/third-party/cldr.active false
	git config submodule.cmake/thirdparty/sanitizers.active false
	git config submodule."cmake/thirdParty/CCache".active false
	git config submodule."bin/msi".active false
	git config submodule."data/voices/victoria".url "${srcdir}/${pkgname%-git}"-victoria-rus
	git config submodule."data/voices/evgeniy-rus".url "${srcdir}/${pkgname%-git}"-evgeniy-rus
	git config submodule."data/voices/evgeniy-eng".url "${srcdir}/${pkgname%-git}"-evgeniy-eng
	git config submodule."data/voices/aleksandr-hq".url "${srcdir}/${pkgname%-git}"-aleksandr-hq-rus
	git config submodule."data/voices/yuriy".url "${srcdir}/${pkgname%-git}"-yuriy-rus
	git config submodule."data/voices/volodymyr".url "${srcdir}/${pkgname%-git}"-volodymyr-ukr
	git config submodule."data/voices/tatiana".url "${srcdir}/${pkgname%-git}"-tatiana-rus
	git config submodule."data/voices/mikhail".url "${srcdir}/${pkgname%-git}"-mikhail-rus
	git config submodule."data/voices/marianna".url "${srcdir}/${pkgname%-git}"-marianna-ukr
	git config submodule."data/voices/lyubov".url "${srcdir}/${pkgname%-git}"-lyubov-eng
	git config submodule."data/voices/vitaliy".url "${srcdir}/${pkgname%-git}"-vitaliy-rus
	git config submodule."data/languages/Polish".url "${srcdir}/${pkgname%-git}"-Polish
	git config submodule."data/voices/magda".url "${srcdir}/${pkgname%-git}"-magda-pol
	git config submodule."external/libs/boost/libs/align".url "${srcdir}/${pkgname%-git}"-align
	git config submodule."external/libs/boost/libs/assert".url "${srcdir}/${pkgname%-git}"-assert
	git config submodule."external/libs/boost/libs/config".url "${srcdir}/${pkgname%-git}"-config
	git config submodule."external/libs/boost/libs/container".url "${srcdir}/${pkgname%-git}"-container
	git config submodule."external/libs/boost/libs/container_hash".url "${srcdir}/${pkgname%-git}"-container_hash
	git config submodule."external/libs/boost/libs/core".url "${srcdir}/${pkgname%-git}"-core
	git config submodule."external/libs/boost/libs/detail".url "${srcdir}/${pkgname%-git}"-detail
	git config submodule."external/libs/boost/libs/exception".url "${srcdir}/${pkgname%-git}"-exception
	git config submodule."external/libs/boost/libs/integer".url "${srcdir}/${pkgname%-git}"-integer
	git config submodule."external/libs/boost/libs/interprocess".url "${srcdir}/${pkgname%-git}"-interprocess
	git config submodule."external/libs/boost/libs/intrusive".url "${srcdir}/${pkgname%-git}"-intrusive
	git config submodule."external/libs/boost/libs/io".url "${srcdir}/${pkgname%-git}"-io
	git config submodule."external/libs/boost/libs/json".url "${srcdir}/${pkgname%-git}"-json
	git config submodule."external/libs/boost/libs/move".url "${srcdir}/${pkgname%-git}"-move
	git config submodule."external/libs/boost/libs/mp11".url "${srcdir}/${pkgname%-git}"-mp11
	git config submodule."external/libs/boost/libs/predef".url "${srcdir}/${pkgname%-git}"-predef
	git config submodule."external/libs/boost/libs/preprocessor".url "${srcdir}/${pkgname%-git}"-preprocessor
	git config submodule."external/libs/boost/libs/smart_ptr".url "${srcdir}/${pkgname%-git}"-smart_ptr
	git config submodule."external/libs/boost/libs/static_assert".url "${srcdir}/${pkgname%-git}"-static_assert
	git config submodule."external/libs/boost/libs/system".url "${srcdir}/${pkgname%-git}"-system
	git config submodule."external/libs/boost/libs/throw_exception".url "${srcdir}/${pkgname%-git}"-throw_exception
	git config submodule."external/libs/boost/libs/tuple".url "${srcdir}/${pkgname%-git}"-tuple
	git config submodule."external/libs/boost/libs/type_traits".url "${srcdir}/${pkgname%-git}"-type_traits
	git config submodule."external/libs/boost/libs/unordered".url "${srcdir}/${pkgname%-git}"-unordered
	git config submodule."external/libs/boost/libs/utility".url "${srcdir}/${pkgname%-git}"-utility
	git config submodule."external/libs/boost/libs/variant2".url "${srcdir}/${pkgname%-git}"-variant2
	git config submodule."external/libs/boost/libs/winapi".url "${srcdir}/${pkgname%-git}"-winapi
	git config submodule."external/libs/boost/libs/tokenizer".url "${srcdir}/${pkgname%-git}"-tokenizer
	git config submodule."external/libs/boost/libs/lexical_cast".url "${srcdir}/${pkgname%-git}"-lexical_cast
	git config submodule."external/libs/boost/libs/algorithm".url "${srcdir}/${pkgname%-git}"-algorithm
	git config submodule."external/libs/boost/libs/nowide".url "${srcdir}/${pkgname%-git}"-nowide
	git config submodule."external/libs/boost/libs/optional".url "${srcdir}/${pkgname%-git}"-optional
	git config submodule."external/libs/boost/libs/date_time".url "${srcdir}/${pkgname%-git}"-date_time
	git config submodule."external/libs/boost/libs/range".url "${srcdir}/${pkgname%-git}"-range
	git config submodule."external/libs/boost/libs/iterator".url "${srcdir}/${pkgname%-git}"-iterator
	git config submodule."external/libs/boost/libs/mpl".url "${srcdir}/${pkgname%-git}"-mpl
	git config submodule."external/libs/boost/libs/concept_check".url "${srcdir}/${pkgname%-git}"-concept_check
	git config submodule."external/libs/boost/libs/numeric_conversion".url "${srcdir}/${pkgname%-git}"-numeric_conversion
	git config submodule."external/libs/boost/libs/array".url "${srcdir}/${pkgname%-git}"-array
	git config submodule."external/libs/boost/libs/bind".url "${srcdir}/${pkgname%-git}"-bind
	git config submodule."external/libs/boost/libs/function".url "${srcdir}/${pkgname%-git}"-function
	git config submodule."external/libs/boost/libs/type_index".url "${srcdir}/${pkgname%-git}"-type_index
	git config submodule."data/voices/natan".url "${srcdir}/${pkgname%-git}"-natan-pol
	git config submodule."data/voices/suze".url "${srcdir}/${pkgname%-git}"-suze-mkd                                                                                                                                        
	git config submodule."data/languages/Albanian".url "${srcdir}/${pkgname%-git}"-Albanian
	git config submodule."data/languages/Brazilian-Portuguese".url "${srcdir}/${pkgname%-git}"-Brazilian-Portuguese
	git config submodule."data/languages/English".url "${srcdir}/${pkgname%-git}"-English
	git config submodule."data/languages/Esperanto".url "${srcdir}/${pkgname%-git}"-Esperanto
	git config submodule."data/languages/Georgian".url "${srcdir}/${pkgname%-git}"-Georgian
	git config submodule."data/languages/Kyrgyz".url "${srcdir}/${pkgname%-git}"-Kyrgyz
	git config submodule."data/languages/Macedonian".url "${srcdir}/${pkgname%-git}"-Macedonian
	git config submodule."data/languages/Russian".url "${srcdir}/${pkgname%-git}"-Russian
	git config submodule."data/languages/Tatar".url "${srcdir}/${pkgname%-git}"-Tatar
	git config submodule."data/languages/Ukrainian".url "${srcdir}/${pkgname%-git}"-Ukrainian
	git config submodule."data/voices/alan".url "${srcdir}/${pkgname%-git}"-alan-eng
	git config submodule."data/voices/aleksandr".url "${srcdir}/${pkgname%-git}"-aleksandr-rus
	git config submodule."data/voices/anatol".url "${srcdir}/${pkgname%-git}"-anatol-ukr
	git config submodule."data/voices/anna".url "${srcdir}/${pkgname%-git}"-anna-rus
	git config submodule."data/voices/azamat".url "${srcdir}/${pkgname%-git}"-azamat-kir
	git config submodule."data/voices/bdl".url "${srcdir}/${pkgname%-git}"-bdl-eng
	git config submodule."data/voices/clb".url "${srcdir}/${pkgname%-git}"-clb-eng
	git config submodule."data/voices/elena".url "${srcdir}/${pkgname%-git}"-elena-rus
	git config submodule."data/voices/hana".url "${srcdir}/${pkgname%-git}"-hana-sqi
	git config submodule."data/voices/irina".url "${srcdir}/${pkgname%-git}"-irina-rus
	git config submodule."data/voices/kiko".url "${srcdir}/${pkgname%-git}"-kiko-mkd
	git config submodule."data/voices/Leticia-F123".url "${srcdir}/${pkgname%-git}"-leticia-f123-pt-br
	git config submodule."data/voices/natalia".url "${srcdir}/${pkgname%-git}"-natalia-ukr
	git config submodule."data/voices/natia".url "${srcdir}/${pkgname%-git}"-natia-kat
	git config submodule."data/voices/nazgul".url "${srcdir}/${pkgname%-git}"-nazgul-kir
	git config submodule."data/voices/slt".url "${srcdir}/${pkgname%-git}"-slt-eng
	git config submodule."data/voices/spomenka".url "${srcdir}/${pkgname%-git}"-spomenka-epo
	git config submodule."data/voices/talgat".url "${srcdir}/${pkgname%-git}"-talgat-tat
	git config submodule."data/voices/arina".url "${srcdir}/${pkgname%-git}"-arina-rus
	git config submodule."data/voices/artemiy".url "${srcdir}/${pkgname%-git}"-artemiy-rus
	git config submodule."data/voices/pavel".url "${srcdir}/${pkgname%-git}"-pavel-rus
	git config submodule."data/voices/vitaliy-ng".url "${srcdir}/${pkgname%-git}"-vitaliy-ng-rus
	git config submodule."data/voices/umka".url "${srcdir}/${pkgname%-git}"-umka-rus
	git config submodule."data/voices/timofey".url "${srcdir}/${pkgname%-git}"-timofey-rus
	git config submodule."data/voices/michal".url "${srcdir}/${pkgname%-git}"-michal-pol
	git config submodule."data/voices/alicja".url "${srcdir}/${pkgname%-git}"-alicja-pol

	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${pkgname%-git}"
	jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS" $jobs
}

package() {
	cd "${pkgname%-git}"
	jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS" $jobs
	install -vDm0644 licenses/gpl-3.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -vDm0644 licenses/by-nc-nd-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-nd-4.0"
	install -vDm0644 licenses/by-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-sa-4.0"
}
