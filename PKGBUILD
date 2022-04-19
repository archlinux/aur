# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=firefox-extension-arch-search
pkgver=1.0.4
_alpkgs_ver=1.0.1
_alwiki_ver=1.0.2
_alaur_ver=1.0.3
_albugsfs_ver=1.0.1
_albugst_ver=1.0.1
_alforuma_ver=1.0.1
_alforumk_ver=1.0.1
_alman_ver=1.0.2
pkgrel=2
pkgdesc="A set of Web Extensions that adds ArchLinux (bug tracker, forum, packages, wiki, AUR) as a search engine to the Firefox browser."
arch=('any')
url="https://github.com/noraj/firefox-extension-arch-search"
license=('MIT')
groups=('firefox-addons')
depends=("firefox")
replaces=('arch-firefox3-search' 'arch-firefox-search')
source=("https://addons.mozilla.org/firefox/downloads/file/3938554/archlinux_aur_search-$_alaur_ver-an+fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658547/archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658548/archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658550/archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658551/archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658552/archlinux_packages_search-$_alpkgs_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3773793/archlinux_wiki_search-$_alwiki_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3708972/archlinux_manual_pages_search-$_alman_ver-fx.xpi"
        "https://raw.githubusercontent.com/noraj/$pkgname/master/LICENSE")
noextract=("archlinux_aur_search-$_alaur_ver-an+fx.xpi"
           "archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi"
           "archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi"
           "archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi"
           "archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi"
           "archlinux_packages_search-$_alpkgs_ver-fx.xpi"
           "archlinux_wiki_search-$_alwiki_ver-fx.xpi"
           "archlinux_manual_pages_search-$_alman_ver-fx.xpi")
b2sums=('5b59f9f17645e9191c03080f141ca0d41b2b250ef33337646fe6085b1cc037d625a0671225e467cbe7219d3bbfb2a31c5ba6dd406c185cd2d2edff26f0224499'
        '972218e036ba1b4b6371e290cfc7c0e1f2282422dab54ec83dccab7db14fa8d12c401439be49a62dc223d8fbb2b09ef2f872844c4db2310ee4027c1e0ddf2cf9'
        '1cb57b7de8233c51c0e6a0f3a746c22b1ba374a6b1dfedd6b34b58631dbb3e299158ca08ba36ed2aaa93ac2b939f99a132929fad817acec5e50a06d7bb030d5c'
        '6793d5b2eacb81e787b4880dd0de5175911f04dffa8521a55235a5762fa298676f289f7713a3a29bdee825f703557fd3631d278656c2f3347691d93daea927e7'
        '7eaf055663269d4f2f5f5cc2c1f80ddcc9126bb4218cdf34f057e251f3b406095f0fef46949423c6a742ecf9918f6be2eded95afc4298240f503c09ea71ade5a'
        '9702895d73c830b44c7f961b7e92493b6a599bd4a9d47c6a982b1e460e99fa539b8e60839cd5ba10adb30691b0022b67a6135bf329674fcfadedb2053e1bfaca'
        'ef2a04119bdf3737c58aeafcb1b21c9e2bbc69af4e29bdf48dc29eca6889c570607018a73753b09e9e6a1cb5c74eb64220450e7380ceea377841ce4cd4ee0733'
        '1a33fd4109e39e1f8286cf45411fa7043b5586d67a1efc7ca41f8210f9cc1829280b27c74e30a62dfbb6eabef3f7a1177568c589c07eb8fdd4eabd5d7f890f87'
        '0d3c9592a3a0e845a5a421876209b1ee5e70024590788f7952bd54df159138c704d16ea994cac4455f2280da3008e03c7fbc0adaee4cdccd75e262b36141b873')

package() {

  install -Dm644 "archlinux_aur_search-$_alaur_ver-an+fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchAur@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsFs@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsT@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumA@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumK@archlinux.org.xpi"
  install -Dm644 "archlinux_packages_search-$_alpkgs_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchPkgs@archlinux.org.xpi"
  install -Dm644 "archlinux_wiki_search-$_alwiki_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchWiki@archlinux.org.xpi"
  install -Dm644 "archlinux_manual_pages_search-$_alman_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchMan@archlinux.org"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
