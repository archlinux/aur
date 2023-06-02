# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=firefox-extension-arch-search
pkgver=1.0.5
_alpkgs_ver=1.0.2
_alwiki_ver=1.0.3
_alaur_ver=1.0.4
_albugsfs_ver=1.0.2
_albugst_ver=1.0.2
_alforuma_ver=1.0.2
_alforumk_ver=1.0.2
_alman_ver=1.0.3
pkgrel=1
pkgdesc="A set of Web Extensions that adds ArchLinux (bug tracker, forum, packages, wiki, AUR) as a search engine to the Firefox browser."
arch=('any')
url="https://github.com/noraj/firefox-extension-arch-search"
license=('MIT')
groups=('firefox-addons')
depends=("firefox")
replaces=('arch-firefox3-search' 'arch-firefox-search')
source=("https://addons.mozilla.org/firefox/downloads/file/4119642/archlinux_aur_search-$_alaur_ver-an+fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119649/archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119648/archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119647/archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119646/archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119645/archlinux_packages_search-$_alpkgs_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119643/archlinux_wiki_search-$_alwiki_ver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4119644/archlinux_manual_pages_search-$_alman_ver-fx.xpi"
        "https://raw.githubusercontent.com/noraj/$pkgname/master/LICENSE")
noextract=("archlinux_aur_search-$_alaur_ver-an+fx.xpi"
           "archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi"
           "archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi"
           "archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi"
           "archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi"
           "archlinux_packages_search-$_alpkgs_ver-fx.xpi"
           "archlinux_wiki_search-$_alwiki_ver-fx.xpi"
           "archlinux_manual_pages_search-$_alman_ver-fx.xpi")
b2sums=('a02d0934decf27e98b2a7d8dd10724e5a9020bdc0a1e5cde182b49d9731153dcbf085d68ac19600dd7dce5c59f577a1e242f96758cfe13370e78914c9a193107'
        '77e85f399e59e7fae9537f32ec3b9afc56935b202fa037766b7a414a807cd6fc980cd49300016c231426c4062c85b78e64b6918ce4c40fc3c410dcda350f5bb8'
        '8c4ea19b27a04a507907b360a13ef9a42044627c00e9d500654a0f5f098dc744aa60ccc9a2814b1bce6f2123c8f7d44f9f78062d47bcad51f356d25f736e49c3'
        'cb167e2b02295f77be2e3df5229281d8aef4acd9cff54f7578122c4b39b030ef42393a0179ddc62704e67e8b68b227accfabf8f0a2f9d370082e1b9932a8270d'
        'a5c1531cd97b8f3946d1d6fa4ce5f8c7bdd7ce03bcb910726493eed7cdb797c1b04ada1a93dc10f29392030203e08f3a5c55dd4cff0d859dcf4b13d0098cfc08'
        '2d0aeab08ebb2791f7aec7b61de7cba44c82e5a49652b72bc58f27e5af7aebf3ca553696342574b51b6d9ddf6d910687786d6c4f4766a4c07f8ab9c12118b75a'
        '59d870e45b57b388daeb8f6e85d15d44339d3b68634d5c2d65acb60d770cb33549864327801832acabcf89fef0a7df2293a50180c3ee2e6a2c910236e8e664df'
        '671faf32a319404b68eb372f749c8105fd5850831f37d34fc80f61d699856a0e2ac7d8d7772639a36dffff1c89b215c896907cb32aa1a5188934a2930806dcaf'
        '0d3c9592a3a0e845a5a421876209b1ee5e70024590788f7952bd54df159138c704d16ea994cac4455f2280da3008e03c7fbc0adaee4cdccd75e262b36141b873')

package() {

  install -Dm644 "archlinux_aur_search-$_alaur_ver-an+fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchAur@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_fs_search-$_albugsfs_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsFs@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_text_search-$_albugst_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsT@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_author_search-$_alforuma_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumA@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_keywords_search-$_alforumk_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumK@archlinux.org.xpi"
  install -Dm644 "archlinux_packages_search-$_alpkgs_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchPkgs@archlinux.org.xpi"
  install -Dm644 "archlinux_wiki_search-$_alwiki_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchWiki@archlinux.org.xpi"
  install -Dm644 "archlinux_manual_pages_search-$_alman_ver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchMan@archlinux.org.xpi"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
