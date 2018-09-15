# Maintainer: Sergei Litvin <litvindev@gmail.com>

pkgname=xrefactory
pkgdesc="Professional refactoring tool for C/Java and Emacs"
url="http://xrefactory.com"
pkgver=1.6.10
pkgrel=1
arch=('x86_64')
license=(custom)
depends=('glibc' 'gcc')
source=(
	http://xrefactory.com/xrefactory/downloads/$pkgver/$pkgname-$pkgver-src.tgz
	0001-Fix-wrong-use-of-memset.patch
	0006-Fix-restoring-regs-after-longjmp.patch
	0007-Fix-mbMemory-cfMemory-tmpWorkMemory-overflowed.patch
	0008-The-variable-xref-set-this-frame-dispatch-data.patch
	0009-Parse-pragma-once-directive.patch
	0010-Parse-include_next-directive.patch
	0011-Detect-GCC-include-directories.patch
	0012-Detect-GCC-Predefined-Macros.patch
	0013-Make-exactpositionresolve-option-affecting-symbols.patch
	0014-Make-include-file-option-processing-file-as-input.patch
	0015-Parse-initializer-list-for-arrays-structs-unions.patch
	0016-Parse-empty-fields-in-struct-declarations.patch
	0017-Parse-asm-statement.patch
	0018-Parse-ranges-in-case-labeled-statement.patch
	0019-Add-missed-C-keywords.patch
	0020-Add-GCC-keyword-extensions.patch
	0021-Add-GCC-built-in-functions.patch
	0022-Fix-macro-expansion-for-constant-parameters.patch
	0023-Fix-__VA_ARGS__-expansion-in-macro-if-variable-argum.patch
	0024-Allow-to-process-.y-files-and-refine-C-grammar-in-ya.patch
	0025-Parse-typeof-keyword.patch
	0026-Add-showincludes-option.patch
	0027-Fix-if-defined-XXX-usage-references.patch
	0028-Check-previous-link-names-for-enums-structs-unions.patch
	0029-Parse-obsolete-GCC-structs-unions-initializer-list.patch
	0030-Fix-stdop-and-optinclude-options.patch
	0031-Fix-parsing-arrays-structs-unions-initializer-list.patch
	0033-Fix-Elisp-obsolete-functions.patch
	0034-Fix-Makefile.common.patch
	0035-Fix-clash-with-library-names.patch)
md5sums=('63e10baa9a5dfce9165570e7c3897701'
         '4791f8a42e53a141ded3bd36e39b3a6d'
         'a00b17df920380afd6689369845acbc8'
         '12b0691bade1c2cf54f7d65be627e4ed'
         'd03d650d3379b9803e9c6e33d00bff01'
         '4016cb112001986916c4f8339cf15558'
         'c396819441e5eefcf853c6fd95e8b235'
         'd3d4a5c0b2f092a7870a3f07cf1e7ed4'
         'eadbf7b35f36fbb714411852e0be7526'
         '0dbaae243f9406b086b06e74976dee56'
         '8cec60b31a4caf9a1593073d690a66bf'
         '5d57e22fb4559632db54da28f98b55ff'
         '727c48c11af8d7b21ce32272ab17aa39'
         '04af9e30863641db22cdc1f25ec35730'
         '2a4dd004387c50787be3adb4412f2865'
         'e841cbbbafa06012db6edbe1fbc26936'
         '302bec1cc494984d108da0a392be30c8'
         '387e847d3e19d64f8883d649ba31e54b'
         '081d03063e8f34223c7fa74982cc240e'
         '4a1b6647233483e20fe861425e331d76'
         '4a2e62ff6a6d3c3afe4318fd90f939b5'
         '4245381509065daa86941467e5ad102c'
         '2c4132f8c6f22352af7390678f4d4304'
         '1684460f5a1d16907428c868d75a27b4'
         '59cf224ed498b053ea3f84a2033d7f66'
         '5c758605b952d406b17f596afe87eeb5'
         '86c7bf7215f680e2b0d50db80ae908d6'
         '501a1993fbb4e0ac88351c10a678866d'
         '8549dc467458994dda13c8fdeef7dee6'
         '633789164b37a833579fb23b1b16c5f1'
         'ff4ac43651958f8e5f61f19858a87aa7')
		 
prepare() {
	cd "$srcdir/xref-any"
	patch --verbose -p1 -i "$srcdir/0001-Fix-wrong-use-of-memset.patch"
	patch --verbose -p1 -i "$srcdir/0006-Fix-restoring-regs-after-longjmp.patch"
	patch --verbose -p1 -i "$srcdir/0007-Fix-mbMemory-cfMemory-tmpWorkMemory-overflowed.patch"
	patch --verbose -p1 -i "$srcdir/0008-The-variable-xref-set-this-frame-dispatch-data.patch"
	patch --verbose -p1 -i "$srcdir/0009-Parse-pragma-once-directive.patch"
	patch --verbose -p1 -i "$srcdir/0010-Parse-include_next-directive.patch"
	patch --verbose -p1 -i "$srcdir/0011-Detect-GCC-include-directories.patch"
	patch --verbose -p1 -i "$srcdir/0012-Detect-GCC-Predefined-Macros.patch"
	patch --verbose -p1 -i "$srcdir/0013-Make-exactpositionresolve-option-affecting-symbols.patch"
	patch --verbose -p1 -i "$srcdir/0014-Make-include-file-option-processing-file-as-input.patch"
	patch --verbose -p1 -i "$srcdir/0015-Parse-initializer-list-for-arrays-structs-unions.patch"
	patch --verbose -p1 -i "$srcdir/0016-Parse-empty-fields-in-struct-declarations.patch"
	patch --verbose -p1 -i "$srcdir/0017-Parse-asm-statement.patch"
	patch --verbose -p1 -i "$srcdir/0018-Parse-ranges-in-case-labeled-statement.patch"
	patch --verbose -p1 -i "$srcdir/0019-Add-missed-C-keywords.patch"
	patch --verbose -p1 -i "$srcdir/0020-Add-GCC-keyword-extensions.patch"
	patch --verbose -p1 -i "$srcdir/0021-Add-GCC-built-in-functions.patch"
	patch --verbose -p1 -i "$srcdir/0022-Fix-macro-expansion-for-constant-parameters.patch"
	patch --verbose -p1 -i "$srcdir/0023-Fix-__VA_ARGS__-expansion-in-macro-if-variable-argum.patch"
	patch --verbose -p1 -i "$srcdir/0024-Allow-to-process-.y-files-and-refine-C-grammar-in-ya.patch"
	patch --verbose -p1 -i "$srcdir/0025-Parse-typeof-keyword.patch"
	patch --verbose -p1 -i "$srcdir/0026-Add-showincludes-option.patch"
	patch --verbose -p1 -i "$srcdir/0027-Fix-if-defined-XXX-usage-references.patch"
	patch --verbose -p1 -i "$srcdir/0028-Check-previous-link-names-for-enums-structs-unions.patch"
	patch --verbose -p1 -i "$srcdir/0029-Parse-obsolete-GCC-structs-unions-initializer-list.patch"
	patch --verbose -p1 -i "$srcdir/0030-Fix-stdop-and-optinclude-options.patch"
	patch --verbose -p1 -i "$srcdir/0031-Fix-parsing-arrays-structs-unions-initializer-list.patch"
	patch --verbose -p1 -i "$srcdir/0033-Fix-Elisp-obsolete-functions.patch"
	patch --verbose -p1 -i "$srcdir/0034-Fix-Makefile.common.patch"
	patch --verbose -p1 -i "$srcdir/0035-Fix-clash-with-library-names.patch"
	cd "$srcdir/xref-any/doc"
	cat "INSTALL" "readme" "readme2" > README
}

build() {
	cd "$srcdir/xref-any/src"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin" \
		  "$pkgdir/usr/share/man" \
		  "$pkgdir/usr/share/man/man1" \
		  "$pkgdir/usr/share/man/man5" \
		  "$pkgdir/usr/share/emacs" \
		  "$pkgdir/usr/share/emacs/site-lisp" \
		  "$pkgdir/usr/share/xrefactory" \
		  "$pkgdir/usr/share/xrefactory/cexercise" \
		  "$pkgdir/usr/share/xrefactory/cexercise/refactorings" \
		  "$pkgdir/usr/share/xrefactory/jexercise" \
		  "$pkgdir/usr/share/xrefactory/jexercise/com" \
		  "$pkgdir/usr/share/xrefactory/jexercise/com/xrefactory" \
		  "$pkgdir/usr/share/xrefactory/jexercise/com/xrefactory/refactorings" \
		  "$pkgdir/usr/share/licenses/xrefactory"
	cd "$srcdir/xref-any/src"
	install -m 755 "xref" "$pkgdir/usr/bin"
	cd "$srcdir/xref-any/doc"
	install -m 644 "xref.man" "$pkgdir/usr/share/man/man1/xref.1"
	install -m 644 "xrefrc.man" "$pkgdir/usr/share/man/man5/xrefrc.5"
    install -m 644 "README" "$pkgdir/usr/share/xrefactory"
	install -m 644 "LICENSE" "$pkgdir/usr/share/licenses/xrefactory"
	cd "$srcdir/xref-any/doc/cexercise"
	install -m 644 "browsing.c" "completions.c" "ideCompileAndRun.c" "index.c" \
			"$pkgdir/usr/share/xrefactory/cexercise"
	cd "$srcdir/xref-any/doc/cexercise/refactorings"
	install -m 644 "extract.c" "index.c" "parameter.c" "rename.c" \
			"$pkgdir/usr/share/xrefactory/cexercise/refactorings"
	cd "$srcdir/xref-any/doc/jexercise"
	install -m 644 "Index.java" "$pkgdir/usr/share/xrefactory/jexercise"
	cd "$srcdir/xref-any/doc/jexercise/com/xrefactory"
	install -m 644 "Browsing.java" "Completion.java" "IdeCompileRun.java" \
			"$pkgdir/usr/share/xrefactory/jexercise/com/xrefactory"
	cd "$srcdir/xref-any/doc/jexercise/com/xrefactory/refactorings"
	install -m 644 "AddRemoveParameter.java" "EncapsulateField.java" "Index.java" "MoveStaticMethod.java" \
			"RenameSymbol.java" "ExtractMethod.java" "MoveMethod.java" "PullUpMethod.java" \
			"$pkgdir/usr/share/xrefactory/jexercise/com/xrefactory/refactorings"
    cd "$srcdir/xref-any/env/emacs"
	install -m 644 "xrefactory.el" "xrefactory2.el" "xrefdoc.el" "xrefprotocol.el" \
			"$pkgdir/usr/share/emacs/site-lisp"
}
