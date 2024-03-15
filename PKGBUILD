# !! THIS PACKAGE WAS DEPRECATED AND WILL BE DELETED LATER. PLEASE INSTALL `clangd-opt-git` INSTEAD OF THIS PACKAGE
#
#
# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Toggle all below patches
# CLANGD_DEFAULT_PATCH_STATE:
#   'n' - disable all patches
#   'y' - apply all patches
#
# Show Doxygen comments in hover (D134130)
# CLANGD_DOXYGEN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve forwarded parameters in hover (D130265)
# CLANGD_RESOLVEFWDPARAMS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement textDocument/codeLens (D91930)
# It's also required patched `vscode-clangd` extension - https://github.com/lightmelodies/vscode-clangd/commit/46266b4adb106b5080f5c771099c777806a16adc
# CLANGD_CODELENS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Contextual postfix completions (D125224)
# Demo: https://asciinema.org/a/rxyoicX44ya2jLDpdbNj3rVcC
# CLANGD_POSTFIXCOMPLETION:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Extract Function: add hoisting support (D138499)
# CLANGD_EXTRACTFUNC:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add inlay hints for scructure paddings
# CLANGD_INLAYHINTSPADS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add hex formats in `size` and `offset` fileds on hover, when values more than 10
# CLANGD_HOVERINHEX:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show mask for bit fields (require CLANGD_HOVERBITFIELDS)
# CLANGD_HOVERBITFIELDSMASK:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show offset of virtual methods
# CLANGD_HOVERVIRTOFF:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show layout hover info everyhere
# CLANGD_HOVERLAYOUTEVERYHERE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Hide definition from hover info for functions and variables
# CLANGD_HOVERNODEFS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve the dependent type from its single instantiation (PR: 71279)
# CLANGD_RESOLVEDEPTYPE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Increase minimal limit for BlockEnd inlay-hints to 10 lines (default is 2)
# CLANGD_INLAYHINTSBLOCKEND:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve includes in incomplete headers
# Limitations: AST for source must be loaded before open incomplete header
# CLANGD_RESOLVEINCHEADERS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add way to remove files from CDB via LSP
# No need in many cases. Useful only in multi project workspaces with patched client https://github.com/clangd/vscode-clangd/pull/487
# CLANGD_LSPREMOVEFROMCDB:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show total record (class/struct/union) paddings in hover
# CLANGD_HOVERRECORDPAD:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Allow specifying what headers are always included via "" or <> (PR: 67749)
# CLANGD_CONFIG_INCLUDE_STYLE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement simple folding of preprocessor branches (PR: 80592)
# CLANGD_PREPROCESSOR_FOLDING:
#   'n' - do not apply this patch
#   'y' - apply this patch

pkgname=clangd-opt
pkgver=19.r4743.gcb6ff746e0c7
pkgrel=2
pkgdesc='DEPRECATED: Install `clangd-opt-git` instead'
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')

package() {
  depends=('clangd-opt-git')

  echo "===== Package 'clangd-opt' was deprecated and must be replaced with 'clangd-opt-git' ====="
}
