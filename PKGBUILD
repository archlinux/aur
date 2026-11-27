# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: Kid <hi at xuann dot wang>
# Maintainer: Mateus Honorato <mateush.honorato@gmail.com>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

# Notion's official Linux build, taken from Notion's signed Flatpak (OSTree)
# repository and run with system Electron. Run ./update.sh
# to move to the latest signed release; it rewrites the generated block below.

pkgname=notion-app-electron
pkgver=7.45.2
pkgrel=1
pkgdesc="Your connected workspace for wiki, docs & projects"
arch=(x86_64 aarch64)
url=https://www.notion.com/desktop
license=(LicenseRef-Notion)
depends=(
	bash
	electron45
	glibc
	hicolor-icon-theme
	libgcc
	libpipewire
	libstdc++
	libxcb
	libxkbcommon
	libxkbcommon-x11
	xdg-utils
)
makedepends=(ostree asar python patchelf)
options=(!strip !debug !emptydirs)
install=.install

_appid=com.notion.app.desktop.notion
_repo=https://app.linux-packages.notion.com
# Notion Desktop Linux <desktop-linux@makenotion.com>
_keyid=1BF8637650053829

source=(
	notion-app
	notion.desktop
	notion.gpg
	patch-notion.py
	LICENSE
)
sha256sums=('b69ffb1e40fca085c0ac34fdff4467cc8cb879edc2c98849b63ede7dfdeeab5b'
            '42e8974edd2c455f5476516aacb3cb467a21e7d039589aa57c61405f95f83d60'
            '51cb713c3bdbc47d4798fde0820ab61b669a6fac14bd24bc3f27414683ef053f'
            'aa48f4c16ecb3c168a4e8aa8205da661d34c552078b76349f1579aa1d577b1f7'
            '8ad6f64f5d46a1a0739e4a45052006a7ef40328dbeda94bf8979e7cc0d85b656')

# BEGIN GENERATED SOURCES (update.sh)
_commit_x86_64=e9f5f941292137edac09d540dc99d92e287596cc6680e6b4df58ba264c129e41
_delta_x86_64='6f/X5QSkhN+2sCdVA3JnZLih1lsxmgOa031i6JkwSnkE'
source_x86_64=(
	"notion-${pkgver}-x86_64.superblock::$_repo/deltas/6f/X5QSkhN%2B2sCdVA3JnZLih1lsxmgOa031i6JkwSnkE/superblock"
	"notion-${pkgver}-x86_64.part0::$_repo/deltas/6f/X5QSkhN%2B2sCdVA3JnZLih1lsxmgOa031i6JkwSnkE/0"
	"notion-${pkgver}-x86_64.commit::$_repo/objects/e9/f5f941292137edac09d540dc99d92e287596cc6680e6b4df58ba264c129e41.commit"
	"notion-${pkgver}-x86_64.commitmeta::$_repo/objects/e9/f5f941292137edac09d540dc99d92e287596cc6680e6b4df58ba264c129e41.commitmeta"
	"756288f22f3e5479bad3bda18076038e8cff4ac62ab904cab74fd64d0348aa39.filez::$_repo/objects/75/6288f22f3e5479bad3bda18076038e8cff4ac62ab904cab74fd64d0348aa39.filez"
	"0d718317e3795ca6ca0081d11b957f2f58791934ecfe954d44332ab33c7c11ce.filez::$_repo/objects/0d/718317e3795ca6ca0081d11b957f2f58791934ecfe954d44332ab33c7c11ce.filez"
	"998fa943725a24d66a047caf3d8d66bf8a963862e50576153e68f877a6b04efd.filez::$_repo/objects/99/8fa943725a24d66a047caf3d8d66bf8a963862e50576153e68f877a6b04efd.filez"
	"1f17ea7081e90216047aecdf91b2448657379b2f834fe95b4d21c55fc76ba66b.filez::$_repo/objects/1f/17ea7081e90216047aecdf91b2448657379b2f834fe95b4d21c55fc76ba66b.filez"
	"581c29638cda314063dd9e04f8f18129a126899033bfac5921a7744548dda15a.filez::$_repo/objects/58/1c29638cda314063dd9e04f8f18129a126899033bfac5921a7744548dda15a.filez"
	"87fa97478d4b96c90bd8b620f75a071f3d0194e80b6624a272ece789712e70ce.filez::$_repo/objects/87/fa97478d4b96c90bd8b620f75a071f3d0194e80b6624a272ece789712e70ce.filez"
	"ef564a484df5d93c3ff9efa78eaff0040040ef611a3eee84325217678bcc3279.filez::$_repo/objects/ef/564a484df5d93c3ff9efa78eaff0040040ef611a3eee84325217678bcc3279.filez"
	"0d06e4f3b149523a53ab7f2bb039c177e69b77bc91028dad356ad3cebeef2cc6.filez::$_repo/objects/0d/06e4f3b149523a53ab7f2bb039c177e69b77bc91028dad356ad3cebeef2cc6.filez"
	"95a1cb0cc2be3b9450b6de535084ecbea5c8b6452b783748e4498f0a1c63dd78.filez::$_repo/objects/95/a1cb0cc2be3b9450b6de535084ecbea5c8b6452b783748e4498f0a1c63dd78.filez"
	"31eeb56d12e15a40453641464732e526b51db20807a8e9d0997c2c052bac7750.filez::$_repo/objects/31/eeb56d12e15a40453641464732e526b51db20807a8e9d0997c2c052bac7750.filez"
	"53f7787613b1808e8dc3f527e2ddd7e0ee82377a132723eea414fa18d01b1a03.filez::$_repo/objects/53/f7787613b1808e8dc3f527e2ddd7e0ee82377a132723eea414fa18d01b1a03.filez"
	"50daec27bdcf1e91c18a8d7fb1c01f57593e744d543fe44f74140f75d373776c.filez::$_repo/objects/50/daec27bdcf1e91c18a8d7fb1c01f57593e744d543fe44f74140f75d373776c.filez"
	"79fa99f10fb19d8b75793d050b564fc6be595130f23a936449c521c14654fb4a.filez::$_repo/objects/79/fa99f10fb19d8b75793d050b564fc6be595130f23a936449c521c14654fb4a.filez"
	"33816f27f677f0877e89848b89d03e9071afa2f52d2347e9a9506d675d8069a9.filez::$_repo/objects/33/816f27f677f0877e89848b89d03e9071afa2f52d2347e9a9506d675d8069a9.filez"
	"322d80a187455fbc3a1cf78b05f6c6445111998a09a807dbbed8c594a7bbb082.filez::$_repo/objects/32/2d80a187455fbc3a1cf78b05f6c6445111998a09a807dbbed8c594a7bbb082.filez"
	"4b3fd26cb913684cdf311ad971f9901fb90e1acc5ff92e6b79918463edac2a70.filez::$_repo/objects/4b/3fd26cb913684cdf311ad971f9901fb90e1acc5ff92e6b79918463edac2a70.filez"
	"411857ec00604bd58c86e67f218ac6a64edc21bbbb0f5cf47a82b2bcb7e11c5b.filez::$_repo/objects/41/1857ec00604bd58c86e67f218ac6a64edc21bbbb0f5cf47a82b2bcb7e11c5b.filez"
	"baa1573ade72891ec6284cff055810ff7a59919ea171fcfd3dd64085f4425a8a.filez::$_repo/objects/ba/a1573ade72891ec6284cff055810ff7a59919ea171fcfd3dd64085f4425a8a.filez"
)
sha256sums_x86_64=(
	'db250c59c6d93bec95771dd800263c974a98d8430acefe2c42a253fb3155b0e7'
	'306e082161cb2b291dc667d9f6a0e6ede7b08cdd99d23752a611f5e148245442'
	'e9f5f941292137edac09d540dc99d92e287596cc6680e6b4df58ba264c129e41'
	'c8651b40ee32c119ffb13ba6a1134a30e963ac20f1923e5351617f212561a49b'
	'964c369f2813a795bc7e8b549e3d55e02980d2ca11edfc112367b6b651d1f37f'
	'b937e4d0b85c69da714889d82b64bccf3c5b584b6531dbad6bb858fd25195024'
	'c75335eb5ff22ccaa0c85c65ee3ab1143e2e0ec38042664f16b390990976c664'
	'643dc36977df35a504dfedbdca319c5937daf50b6950f9cfb3ab456d4eda4716'
	'c1dc1c85d6765bcab5e3ac31c3e6deff313b815fa02981c9ed7d7ab12498a7c4'
	'34e5014c9c0ce8fc027b046b63cc95faf556722ba4357a573dddbbe03585f1c0'
	'801874184100bd04cb39b32fa599281ebba2a511b75a0148ac060a0f86e29282'
	'f01547149700aa608cf65a285ad0da4eb904aae1fe99f3b02271b63d2aae4950'
	'a46fc2c47578cfe2e7a50aceff8f2456b3f0fcd4159f310b50adfc1a49062513'
	'38989025e316acacfe89b02b3cf65ea5439f62eb8c02fbce6832582aa1add6b7'
	'af8bebb55de6f4916f89e4ed99c036853d090ea9b73231cffd47c42248b249b6'
	'02724ae4811a27e94f84f3682a0318fb7aa6c5d14f657af22ade0be0f51beb9b'
	'38f69009dc4655d322963214a1e51f3a2196890c2e056198c78475d6e44b72d8'
	'f9857e3dc61b117970124fec1645a7ab30ec7dcf8a4f778c81eb80e3d169ab8d'
	'19cb04b16e9e374ac00134e99bd696ee0b1cbcd4bccda829fcc590b5b7b52255'
	'64ac3b17d53dae854e842c83e28b13ae77e4d94fe920591e5a01f55261640bd6'
	'c22eb6eaac3c4cd0991c95594494c7679b621c0a873f4b43f07d019267b17802'
	'6bac44cbd8ba855cc2fef04152408aa8095675e03755021514c525d086164558'
)
_commit_aarch64=8195ef777223ae0f778f37f9d30c7e6ceacc283ecc9b6cc9fb83565e19a45288
_delta_aarch64='gZ/Xvd3Ijrg93jzf50wx+bOrMKD7Mm2zJ+4NWXhmkUog'
source_aarch64=(
	"notion-${pkgver}-aarch64.superblock::$_repo/deltas/gZ/Xvd3Ijrg93jzf50wx%2BbOrMKD7Mm2zJ%2B4NWXhmkUog/superblock"
	"notion-${pkgver}-aarch64.part0::$_repo/deltas/gZ/Xvd3Ijrg93jzf50wx%2BbOrMKD7Mm2zJ%2B4NWXhmkUog/0"
	"notion-${pkgver}-aarch64.commit::$_repo/objects/81/95ef777223ae0f778f37f9d30c7e6ceacc283ecc9b6cc9fb83565e19a45288.commit"
	"notion-${pkgver}-aarch64.commitmeta::$_repo/objects/81/95ef777223ae0f778f37f9d30c7e6ceacc283ecc9b6cc9fb83565e19a45288.commitmeta"
	"25a4d038cf0437de18687342454b21d8e5115365ce70a0d332e943819c298189.filez::$_repo/objects/25/a4d038cf0437de18687342454b21d8e5115365ce70a0d332e943819c298189.filez"
	"1d848cb879e8440cfa4ce282f35a2122bec4bf9481bd5c3801954d2cc28f7ba5.filez::$_repo/objects/1d/848cb879e8440cfa4ce282f35a2122bec4bf9481bd5c3801954d2cc28f7ba5.filez"
	"5f7a699dd8d5dd16fcdd2650aa26863e5257d09c5755b0d493b0044010acd0bf.filez::$_repo/objects/5f/7a699dd8d5dd16fcdd2650aa26863e5257d09c5755b0d493b0044010acd0bf.filez"
	"1bbae2aa67c4e9660ae152cc3460aded8ecb33c9821ece7567da66e0d909db32.filez::$_repo/objects/1b/bae2aa67c4e9660ae152cc3460aded8ecb33c9821ece7567da66e0d909db32.filez"
	"998fa943725a24d66a047caf3d8d66bf8a963862e50576153e68f877a6b04efd.filez::$_repo/objects/99/8fa943725a24d66a047caf3d8d66bf8a963862e50576153e68f877a6b04efd.filez"
	"95b039796bda888016379b54509f7c7a3ab681eb69c3b6de5bd190513146f44f.filez::$_repo/objects/95/b039796bda888016379b54509f7c7a3ab681eb69c3b6de5bd190513146f44f.filez"
	"52c72a4f630497b82bc926bf14974c6f4a79cc26eca35a13637408747cf8fa0c.filez::$_repo/objects/52/c72a4f630497b82bc926bf14974c6f4a79cc26eca35a13637408747cf8fa0c.filez"
	"fbad14890a4e328e9d18d74853a891882d620c25cc3b79996c28ce6d893c1349.filez::$_repo/objects/fb/ad14890a4e328e9d18d74853a891882d620c25cc3b79996c28ce6d893c1349.filez"
	"b3a5667adf2bcc8397b4aaed77f1ba3c516d7b14dae460d84489b3c7b74d4753.filez::$_repo/objects/b3/a5667adf2bcc8397b4aaed77f1ba3c516d7b14dae460d84489b3c7b74d4753.filez"
	"51d36d3db0672c498abc367eebcfed8d28b28b50a6cf68b24a801f636b7cf765.filez::$_repo/objects/51/d36d3db0672c498abc367eebcfed8d28b28b50a6cf68b24a801f636b7cf765.filez"
	"c3b29be7594598e7dbce8040783fd0ad46fedb1d0bfae926ee059eb17c64ca39.filez::$_repo/objects/c3/b29be7594598e7dbce8040783fd0ad46fedb1d0bfae926ee059eb17c64ca39.filez"
	"9f9f367645babb3138637fb77909e0892e4489ad3fc195a1561d87e859959147.filez::$_repo/objects/9f/9f367645babb3138637fb77909e0892e4489ad3fc195a1561d87e859959147.filez"
	"4b3fd26cb913684cdf311ad971f9901fb90e1acc5ff92e6b79918463edac2a70.filez::$_repo/objects/4b/3fd26cb913684cdf311ad971f9901fb90e1acc5ff92e6b79918463edac2a70.filez"
	"a66dfa39871bc3d256a957dc7f0d5699290b06afb8fdb02b604f1fdcf8616e4d.filez::$_repo/objects/a6/6dfa39871bc3d256a957dc7f0d5699290b06afb8fdb02b604f1fdcf8616e4d.filez"
	"baa1573ade72891ec6284cff055810ff7a59919ea171fcfd3dd64085f4425a8a.filez::$_repo/objects/ba/a1573ade72891ec6284cff055810ff7a59919ea171fcfd3dd64085f4425a8a.filez"
	"8d8d49cfa6fc15a4dd37f56e4067120615871c5aa24a1159885f69df86a6ab3f.filez::$_repo/objects/8d/8d49cfa6fc15a4dd37f56e4067120615871c5aa24a1159885f69df86a6ab3f.filez"
	"6509050ec04aa7bbd661e8203d54d6eb448e6eb12de7a9974314c365369f4039.filez::$_repo/objects/65/09050ec04aa7bbd661e8203d54d6eb448e6eb12de7a9974314c365369f4039.filez"
)
sha256sums_aarch64=(
	'c2c2ca9356991c3134175a5884617f807e287a6eef2b5ff910e10deb0e1325c5'
	'e6592faa75ddbcc74160b2cee57fbf57a45c501827884aa2fefa3feb607e722a'
	'8195ef777223ae0f778f37f9d30c7e6ceacc283ecc9b6cc9fb83565e19a45288'
	'401a910461eea05e50bed853f7a42b1de73a2d7e4de60a1b36df045ec24c4348'
	'4a8caa834f15ce66871993da636ee59b72723da60e1877632b5dda4e6f8aa82a'
	'd5a00c6e3e8a00806c778b4e1aaee00b2db2697e246dea7f2be4b362a5d25a8e'
	'f8dfe1a1bd43a92fffe13b42c315a16ffe6176889f0a291f6016db0a17ea5cfd'
	'26df12a003d32116e329620579b476968b2ab9a579935f20015051cd8a43557d'
	'c75335eb5ff22ccaa0c85c65ee3ab1143e2e0ec38042664f16b390990976c664'
	'f9057983f62127c5813d03bed6397b075e1280bc669ec55790e17bb78313da4e'
	'ed34e07484a93da513e78c052ac119f7da63e90cc05a12937d90d6f983e376fa'
	'd668139ee7874bd85b9e7df953ddbc8a640c009855376f08ee09ec26f6f1859a'
	'f35bb5346f5ad658f2265296872972a1ad1783fd26ad4100b493cd9ad2875794'
	'94cd104c403f7aecd58cf9e9e310a31b34a8c09c5c8d9d6a896a75bc0c58a1de'
	'c7dd05f191f4b0333eecbcd377ab4d913a5973d86f9f644ce7a813959ecfe28d'
	'f2473dc4614c383b6db408a2222519edb18d3b84c50f0b4aa2245d2a316f2355'
	'64ac3b17d53dae854e842c83e28b13ae77e4d94fe920591e5a01f55261640bd6'
	'd8d2f3666535c8abf1de852b859739de058c5c29c150e9fc62d5d60cd5bfdcd8'
	'6bac44cbd8ba855cc2fef04152408aa8095675e03755021514c525d086164558'
	'c9fdf500f8e8691fb8a2eb3cc69e6cb0fb7b79f24541ada478fda3a837c3f78c'
	'509963a4452e0b13b1ce8e1df1a1f6e20d3a5c9e83f0e1ef074418b8c9b05b34'
)
# END GENERATED SOURCES

noextract=("${source_x86_64[@]%%::*}" "${source_aarch64[@]%%::*}")

prepare() {
	local commit_var=_commit_$CARCH delta_var=_delta_$CARCH
	local commit=${!commit_var} delta=${!delta_var}
	local ref=app/$_appid/$CARCH/stable
	local local_repo=$srcdir/flatpak-files ostree_repo=$srcdir/ostree

	# Rebuild a minimal archive repository from the downloaded delta files.
	rm -rf "$local_repo" "$ostree_repo" "$srcdir/notion" "$srcdir/icons" "$srcdir/asar_patched"
	ostree --repo="$local_repo" init --mode=archive
	install -d "$local_repo/deltas/$delta" "$local_repo/objects/${commit:0:2}" \
		"$local_repo/refs/heads/$(dirname "$ref")"
	cp "notion-$pkgver-$CARCH.superblock" "$local_repo/deltas/$delta/superblock"
	local part
	for part in notion-"$pkgver"-"$CARCH".part*; do
		cp "$part" "$local_repo/deltas/$delta/${part##*.part}"
	done
	cp "notion-$pkgver-$CARCH.commit" "$local_repo/objects/${commit:0:2}/${commit:2}.commit"
	cp "notion-$pkgver-$CARCH.commitmeta" "$local_repo/objects/${commit:0:2}/${commit:2}.commitmeta"
	local obj
	for obj in *.filez; do
		[[ -f "$obj" ]] || continue
		install -Dm644 "$obj" "$local_repo/objects/${obj:0:2}/${obj:2}"
	done
	echo "$commit" > "$local_repo/refs/heads/$ref"
	ostree --repo="$local_repo" summary -u

	# Pull offline. The pull enforces Notion's signature and the commit's ref
	# binding, and the static delta checks every object it writes.
	ostree --repo="$ostree_repo" init --mode=bare-user-only
	ostree --repo="$ostree_repo" remote add --set=gpg-verify=true --set=gpg-verify-summary=false \
		--gpg-import="$srcdir/notion.gpg" local "file://$local_repo" >/dev/null
	ostree --repo="$ostree_repo" pull --require-static-deltas local "$ref"
	[[ "$(ostree --repo="$ostree_repo" rev-parse "local:$ref")" == "$commit" ]]
	local show
	show="$(LC_ALL=C ostree --repo="$ostree_repo" show --gpg-verify-remote=local "$commit")"
	grep -q 'Good signature' <<<"$show"
	grep -q "key ID $_keyid" <<<"$show"
	grep -Eq "Notion-(arm64-)?${pkgver//./\\.}\\.flatpak" <<<"$show" ||
		{ echo "commit $commit is not Notion $pkgver" >&2; return 1; }

	# Keep the application resources and audio helper. System Electron supplies
	# the runtime, Chromium files, sandbox, and Electron licenses.
	ostree --repo="$ostree_repo" checkout --user-mode --subpath="/files/lib/$_appid/resources" "$commit" "$srcdir/notion"
	ostree --repo="$ostree_repo" cat "$commit" "/files/lib/$_appid/audio_proxy" > "$srcdir/notion/audio_proxy"
	chmod 755 "$srcdir/notion/audio_proxy"
	ostree --repo="$ostree_repo" checkout --user-mode --subpath=/files/share/icons/hicolor "$commit" "$srcdir/icons"
	rm -rf "$local_repo" "$ostree_repo"

	asar extract "$srcdir/notion/app.asar" "$srcdir/asar_patched"
	python "$srcdir/patch-notion.py" "$srcdir/asar_patched" "$pkgver"
	# Discard platform stubs that Linux does not load.
	rm -rf "$srcdir/asar_patched/node_modules/@vscode/windows-registry" \
		"$srcdir/asar_patched/node_modules/cf-prefs"
	rm -f "$srcdir/asar_patched/.webpack/main/native_modules/adjust_get_current_system_volume_vista_plus.exe"
	# The upstream PipeWire prebuild retains paths from its build machine.
	patchelf --remove-rpath "$srcdir/asar_patched/node_modules/node-pipewire/dist/binding/napi-v6/index.node"
	# Preserve executable helpers and native modules outside the archive.
	rm -rf "$srcdir/notion/app.asar.unpacked"
	asar pack "$srcdir/asar_patched" "$srcdir/notion/app.asar" --unpack '*.node'
}

package() {
	install -d "$pkgdir/usr/lib"
	cp -a "$srcdir/notion" "$pkgdir/usr/lib/notion-app"

	install -Dm755 notion-app -t "$pkgdir/usr/bin"
	install -Dm644 notion.desktop -t "$pkgdir/usr/share/applications"
	local icon size
	for icon in "$srcdir"/icons/*/apps/"$_appid".png; do
		size=${icon#"$srcdir/icons/"}; size=${size%%/*}
		install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/notion.png"
	done
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.notion"
	install -m644 "$srcdir"/asar_patched/.webpack/main/*.LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
