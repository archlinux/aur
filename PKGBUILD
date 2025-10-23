# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=artemis-lang
_npmsub=cli
pkgname=$_npmname
pkgver=0.3.4
pkgrel=1

pkgdesc="TypeScript-Powered Scripting Language"
arch=("x86_64")
url="https://github.com/chaqchase/artemis"
_urlraw="https://raw.githubusercontent.com/chaqchase/artemis/@artemis-lang/cli@${pkgver}"
license=("MIT")

replaces=("nodejs-${_npmname}")
makedepends=("npm" "jq")
provides=("$_npmname")
depends=("nodejs")

options=(!strip emptydirs staticlibs zipman)
noextract=("${_npmname}-${pkgver}.tgz")

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/@${_npmname}/${_npmsub}/-/${_npmsub}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"accessors-${pkgver}.art::${_urlraw}/examples/accessors.art"
		"call-a-function-${pkgver}.art::${_urlraw}/examples/call-a-function.art"
		"comments-${pkgver}.art::${_urlraw}/examples/comments.art"
		"fatorial-${pkgver}.art::${_urlraw}/examples/fatorial.art"
		"fib-seq-${pkgver}.art::${_urlraw}/examples/fib-seq.art"
		"fizz-buzz-${pkgver}.art::${_urlraw}/examples/fizz-buzz.art"
		"fs-${pkgver}.art::${_urlraw}/examples/fs.art"
		"functions-${pkgver}.art::${_urlraw}/examples/functions.art"
		"hello-world-${pkgver}.art::${_urlraw}/examples/hello-world.art"
		"if-statements-${pkgver}.art::${_urlraw}/examples/if-statements.art"
		"import-exports-${pkgver}.art::${_urlraw}/examples/import-exports.art"
		"js-code-${pkgver}.art::${_urlraw}/examples/js-code.art"
		"loops-${pkgver}.art::${_urlraw}/examples/loops.art"
		"match-${pkgver}.art::${_urlraw}/examples/match.art"
		"native-functions-${pkgver}.art::${_urlraw}/examples/native-functions.art"
		"operators-${pkgver}.art::${_urlraw}/examples/operators.art"
		"variables-${pkgver}.art::${_urlraw}/examples/variables.art"
		"word-occurrences-${pkgver}.art::${_urlraw}/examples/word-occurrences.art")
b2sums=('c8789ef07df1a3ea4ef5b008573b5a727e2bf806e7c596107faff41ac943df546751cb08791722e2def07d44f3baa037b6b7760ec9db1e0b9edee83e4baf90c9'
        '3fd280fb091d7277f7a7abc47c1e52cde1d806d59b575476411685e1fec6cb229de16e83288ea54ce81abc31bbac51cbd8df28288267e0c38513ece313a6d7f7'
        '26d0c38dc2a158ab297c8b83b12d6b6cf95b889fb6467b970fb22dd7add0bbe67a59d5dd5b4cdc92e328437d524c720d8dcc1ec888f4d9bd2d7020d4e69b90a4'
        '8c42015510c4054a16e91e5439fe52d3da26328facaa148ed80547efcb4aa24f486a9f6bf5df987f426270f715d9746fbf978e4f37136eb9904f6de8f0b48883'
        '98861d0f223f443b6967ba3b7d89d1740713227b5450eb19091651093038eea25231e69c79caca077beb90177753d97ca61d04bd328ee0e7d4aa2029ec5311c8'
        '92ea2f22b8f3d823a8a2831e3a069bb97520c1db9fbdaf8c98009e2a84f850b58e6fef0f53af36004bfecc772d561dd563b5b79975ba4bb28188026c7a8899d4'
        '32a5b82147786bb85912883103475bb9756ba11f1c6b43cdeab87a30577ceb8a5f8c4d13a4189ccdf946a9de0c6b042d3fb8b8d1805c1c47e34cf840f401b478'
        '8805e7e120e653a3888d0e6a1ca707b085e6dd00a8052556d1add5accae8678057f1c0b70b604024f94c17fa64250eff5135cd88f3db2abbbcb89d187cd34771'
        '3d21cd02a5ea3eff0cae931ac4aded67f03a422aec1ec77e3590600cb6cae27c8a2f858cea05b04f0b1c69d180219ada78c0bb24c15a6831fa9992073a06b036'
        'a58d4c072eae6c4fd2b222659370130a662b3cfd138157629e5049ac91f2eb94b15ddca39481e079d553138af4e5226cc37a457db03852a225d72e22c7f2918e'
        '836e03e10cabb4adeef31250f7a393a6563cb096bfaab742d0382aefe26103bc8b7c5fd98a45f527279829e84337ac808557031e00b897a125461e6448d7ec47'
        '29aee6fafcc40c9224c5b91ea08f5c01e20e872085446cb0fd09764d3799f96e14febd954bb7915da4ef7cf1dd0da52154afe1d1cc568d1daffd8532d192bdf3'
        '638567fd1d698c6512299ddce0db28a281f7dd8363f4e98fc6dddfd54138fce23097425936073ab3e54f25b88590aff9737139e42c6e7e8ac660fee1ad1ebb33'
        '6ed7cd4a595c8e74eddff6731cc785b9b35b7e5c0641592a6a28ba7853b7c167b8b07751e301d9c18adc7b4d35482d3f34e588ec1443a6335a91a592dde50829'
        'f1ba025087d90cd807aa797f5ab6fd291ace507dd023911aeb0bcf6be4df0fa5eda402793c2c2a2552065a699ff2ecc0060d6350e4268fa37004040c75d71ec7'
        'd9e95b189a3c3aa0b4544b326ca3b59dff674ed19c7d23ee98d1ccb8c6abfd80f834a3e4149990ed2d91f3ba923df8b0e45ac64ae619ded7af6cedcff69c309b'
        '2c0bdbb5512129890098593022d6ccff7283d36fb5cc211fe83fbdc48cb343c7f794fd96161dde8997796deaec135a8b92c136ad61c3120ddecf3186c5098b69'
        '203570075056c13015c8322a9a4f5f5e909af994670092aade834c00adc154ad0c6daf46ef478f78d4d62db8368d6a84aabc657bff63bee00617eb2a003cf6b5'
        '60c7f4a7a25a1bf8cb77cd21d5e78d74778fc4dcec2685cd14890fdd97f1eaffce0043f5449a2fc967d47966b5f79905ff347e745ab5132dc8d5f8adca1bc022'
        '4e69f1e33fe77a4308ccda6e8e898613ae749c6bb969e28b5ad5db3c72e0b33a4258e7808a77af884cdf9590e32a540fc9f1e203973cd10b18ae6c4c477bbb47'
        '82ca22d6725854787f39567513062da5b5920f680f143746901be1b60e56e84cd1cec6b7d55faf477f9e1bbc604053b4f3b2dd071a419730ed75358dab76a8bd')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines

prepare() {
	mkdir -p ./examples
	for art in *.art; do mv ${art} examples/${art//-${pkgver}/} ; done
}

package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/@${_npmname}/${_npmsub}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	find "${pkgdir}" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
		mv "${tmppackage}" "${pkgjson}"
		chmod 644 "${pkgjson}"
	done

	# Install README file
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm 644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install examples
	cd ./examples
	for art in *.art; do
		install -Dm644 "${art}" "${pkgdir}/usr/share/${pkgname}/examples/${art}"
	done
}
