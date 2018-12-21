# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.3
pkgrel=2
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/gitit
license=(GPL)
depends=(libffi gmp mailcap ncurses5-compat-libs numactl zlib)
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(cabal-install)
source=(haskell-ConfigFile-1.1.4.tar.gz::https://hackage.haskell.org/package/ConfigFile-1.1.4/ConfigFile-1.1.4.tar.gz
        haskell-Diff-0.3.4.tar.gz::https://hackage.haskell.org/package/Diff-0.3.4/Diff-0.3.4.tar.gz
        haskell-Glob-0.9.3.tar.gz::https://hackage.haskell.org/package/Glob-0.9.3/Glob-0.9.3.tar.gz
        haskell-HStringTemplate-0.8.7.tar.gz::https://hackage.haskell.org/package/HStringTemplate-0.8.7/HStringTemplate-0.8.7.tar.gz
        haskell-HTTP-4000.3.12-1.cabal::https://hackage.haskell.org/package/HTTP-4000.3.12/revision/1.cabal
        haskell-HTTP-4000.3.12.tar.gz::https://hackage.haskell.org/package/HTTP-4000.3.12/HTTP-4000.3.12.tar.gz
        haskell-HUnit-1.6.0.0.tar.gz::https://hackage.haskell.org/package/HUnit-1.6.0.0/HUnit-1.6.0.0.tar.gz
        haskell-HsYAML-0.1.1.2-2.cabal::https://hackage.haskell.org/package/HsYAML-0.1.1.2/revision/2.cabal
        haskell-HsYAML-0.1.1.2.tar.gz::https://hackage.haskell.org/package/HsYAML-0.1.1.2/HsYAML-0.1.1.2.tar.gz
        haskell-JuicyPixels-3.3.2.tar.gz::https://hackage.haskell.org/package/JuicyPixels-3.3.2/JuicyPixels-3.3.2.tar.gz
        haskell-MissingH-1.4.0.1-1.cabal::https://hackage.haskell.org/package/MissingH-1.4.0.1/revision/1.cabal
        haskell-MissingH-1.4.0.1.tar.gz::https://hackage.haskell.org/package/MissingH-1.4.0.1/MissingH-1.4.0.1.tar.gz
        haskell-QuickCheck-2.12.6.1.tar.gz::https://hackage.haskell.org/package/QuickCheck-2.12.6.1/QuickCheck-2.12.6.1.tar.gz
        haskell-SHA-1.6.4.4.tar.gz::https://hackage.haskell.org/package/SHA-1.6.4.4/SHA-1.6.4.4.tar.gz
        haskell-aeson-1.3.1.1.tar.gz::https://hackage.haskell.org/package/aeson-1.3.1.1/aeson-1.3.1.1.tar.gz
        haskell-aeson-pretty-0.8.7.tar.gz::https://hackage.haskell.org/package/aeson-pretty-0.8.7/aeson-pretty-0.8.7.tar.gz
        haskell-ansi-terminal-0.8.1.tar.gz::https://hackage.haskell.org/package/ansi-terminal-0.8.1/ansi-terminal-0.8.1.tar.gz
        haskell-asn1-encoding-0.9.5.tar.gz::https://hackage.haskell.org/package/asn1-encoding-0.9.5/asn1-encoding-0.9.5.tar.gz
        haskell-asn1-parse-0.9.4.tar.gz::https://hackage.haskell.org/package/asn1-parse-0.9.4/asn1-parse-0.9.4.tar.gz
        haskell-asn1-types-0.3.2.tar.gz::https://hackage.haskell.org/package/asn1-types-0.3.2/asn1-types-0.3.2.tar.gz
        haskell-async-2.2.1-1.cabal::https://hackage.haskell.org/package/async-2.2.1/revision/1.cabal
        haskell-async-2.2.1.tar.gz::https://hackage.haskell.org/package/async-2.2.1/async-2.2.1.tar.gz
        haskell-attoparsec-0.13.2.2-2.cabal::https://hackage.haskell.org/package/attoparsec-0.13.2.2/revision/2.cabal
        haskell-attoparsec-0.13.2.2.tar.gz::https://hackage.haskell.org/package/attoparsec-0.13.2.2/attoparsec-0.13.2.2.tar.gz
        haskell-base-compat-0.10.4.tar.gz::https://hackage.haskell.org/package/base-compat-0.10.4/base-compat-0.10.4.tar.gz
        haskell-base-orphans-0.8.tar.gz::https://hackage.haskell.org/package/base-orphans-0.8/base-orphans-0.8.tar.gz
        haskell-base64-bytestring-1.0.0.1.tar.gz::https://hackage.haskell.org/package/base64-bytestring-1.0.0.1/base64-bytestring-1.0.0.1.tar.gz
        haskell-basement-0.0.8-1.cabal::https://hackage.haskell.org/package/basement-0.0.8/revision/1.cabal
        haskell-basement-0.0.8.tar.gz::https://hackage.haskell.org/package/basement-0.0.8/basement-0.0.8.tar.gz
        haskell-blaze-builder-0.4.1.0.tar.gz::https://hackage.haskell.org/package/blaze-builder-0.4.1.0/blaze-builder-0.4.1.0.tar.gz
        haskell-blaze-html-0.9.1.1.tar.gz::https://hackage.haskell.org/package/blaze-html-0.9.1.1/blaze-html-0.9.1.1.tar.gz
        haskell-blaze-markup-0.8.2.2.tar.gz::https://hackage.haskell.org/package/blaze-markup-0.8.2.2/blaze-markup-0.8.2.2.tar.gz
        haskell-byteable-0.1.1.tar.gz::https://hackage.haskell.org/package/byteable-0.1.1/byteable-0.1.1.tar.gz
        haskell-call-stack-0.1.0.tar.gz::https://hackage.haskell.org/package/call-stack-0.1.0/call-stack-0.1.0.tar.gz
        haskell-case-insensitive-1.2.0.11.tar.gz::https://hackage.haskell.org/package/case-insensitive-1.2.0.11/case-insensitive-1.2.0.11.tar.gz
        haskell-cereal-0.5.7.0.tar.gz::https://hackage.haskell.org/package/cereal-0.5.7.0/cereal-0.5.7.0.tar.gz
        haskell-cmark-gfm-0.1.5.tar.gz::https://hackage.haskell.org/package/cmark-gfm-0.1.5/cmark-gfm-0.1.5.tar.gz
        haskell-colour-2.3.4.tar.gz::https://hackage.haskell.org/package/colour-2.3.4/colour-2.3.4.tar.gz
        haskell-conduit-1.3.0.3.tar.gz::https://hackage.haskell.org/package/conduit-1.3.0.3/conduit-1.3.0.3.tar.gz
        haskell-conduit-extra-1.3.0.tar.gz::https://hackage.haskell.org/package/conduit-extra-1.3.0/conduit-extra-1.3.0.tar.gz
        haskell-connection-0.2.8.tar.gz::https://hackage.haskell.org/package/connection-0.2.8/connection-0.2.8.tar.gz
        haskell-cookie-0.4.4.tar.gz::https://hackage.haskell.org/package/cookie-0.4.4/cookie-0.4.4.tar.gz
        haskell-cryptohash-md5-0.11.100.1-3.cabal::https://hackage.haskell.org/package/cryptohash-md5-0.11.100.1/revision/3.cabal
        haskell-cryptohash-md5-0.11.100.1.tar.gz::https://hackage.haskell.org/package/cryptohash-md5-0.11.100.1/cryptohash-md5-0.11.100.1.tar.gz
        haskell-cryptohash-sha1-0.11.100.1-3.cabal::https://hackage.haskell.org/package/cryptohash-sha1-0.11.100.1/revision/3.cabal
        haskell-cryptohash-sha1-0.11.100.1.tar.gz::https://hackage.haskell.org/package/cryptohash-sha1-0.11.100.1/cryptohash-sha1-0.11.100.1.tar.gz
        haskell-cryptonite-0.25.tar.gz::https://hackage.haskell.org/package/cryptonite-0.25/cryptonite-0.25.tar.gz
        haskell-css-text-0.1.3.0.tar.gz::https://hackage.haskell.org/package/css-text-0.1.3.0/css-text-0.1.3.0.tar.gz
        haskell-data-default-0.7.1.1.tar.gz::https://hackage.haskell.org/package/data-default-0.7.1.1/data-default-0.7.1.1.tar.gz
        haskell-data-default-class-0.1.2.0.tar.gz::https://hackage.haskell.org/package/data-default-class-0.1.2.0/data-default-class-0.1.2.0.tar.gz
        haskell-data-default-instances-containers-0.0.1.tar.gz::https://hackage.haskell.org/package/data-default-instances-containers-0.0.1/data-default-instances-containers-0.0.1.tar.gz
        haskell-data-default-instances-dlist-0.0.1.tar.gz::https://hackage.haskell.org/package/data-default-instances-dlist-0.0.1/data-default-instances-dlist-0.0.1.tar.gz
        haskell-data-default-instances-old-locale-0.0.1.tar.gz::https://hackage.haskell.org/package/data-default-instances-old-locale-0.0.1/data-default-instances-old-locale-0.0.1.tar.gz
        haskell-digest-0.0.1.2.tar.gz::https://hackage.haskell.org/package/digest-0.0.1.2/digest-0.0.1.2.tar.gz
        haskell-dlist-0.8.0.5.tar.gz::https://hackage.haskell.org/package/dlist-0.8.0.5/dlist-0.8.0.5.tar.gz
        haskell-doctemplates-0.2.2.1.tar.gz::https://hackage.haskell.org/package/doctemplates-0.2.2.1/doctemplates-0.2.2.1.tar.gz
        haskell-entropy-0.4.1.3.tar.gz::https://hackage.haskell.org/package/entropy-0.4.1.3/entropy-0.4.1.3.tar.gz
        haskell-erf-2.0.0.0.tar.gz::https://hackage.haskell.org/package/erf-2.0.0.0/erf-2.0.0.0.tar.gz
        haskell-exceptions-0.8.3-5.cabal::https://hackage.haskell.org/package/exceptions-0.8.3/revision/5.cabal
        haskell-exceptions-0.8.3.tar.gz::https://hackage.haskell.org/package/exceptions-0.8.3/exceptions-0.8.3.tar.gz
        haskell-extensible-exceptions-0.1.1.4.tar.gz::https://hackage.haskell.org/package/extensible-exceptions-0.1.1.4/extensible-exceptions-0.1.1.4.tar.gz
        haskell-fail-4.9.0.0.tar.gz::https://hackage.haskell.org/package/fail-4.9.0.0/fail-4.9.0.0.tar.gz
        haskell-feed-1.0.0.0-4.cabal::https://hackage.haskell.org/package/feed-1.0.0.0/revision/4.cabal
        haskell-feed-1.0.0.0.tar.gz::https://hackage.haskell.org/package/feed-1.0.0.0/feed-1.0.0.0.tar.gz
        haskell-filestore-0.6.3.3.tar.gz::https://hackage.haskell.org/package/filestore-0.6.3.3/filestore-0.6.3.3.tar.gz
        haskell-ghc-paths-0.1.0.9-4.cabal::https://hackage.haskell.org/package/ghc-paths-0.1.0.9/revision/4.cabal
        haskell-ghc-paths-0.1.0.9.tar.gz::https://hackage.haskell.org/package/ghc-paths-0.1.0.9/ghc-paths-0.1.0.9.tar.gz
        haskell-gitit-$pkgver.tar.gz::https://hackage.haskell.org/package/gitit-$pkgver/gitit-$pkgver.tar.gz
        haskell-haddock-library-1.6.0.tar.gz::https://hackage.haskell.org/package/haddock-library-1.6.0/haddock-library-1.6.0.tar.gz
        haskell-happstack-server-7.5.1.1.tar.gz::https://hackage.haskell.org/package/happstack-server-7.5.1.1/happstack-server-7.5.1.1.tar.gz
        haskell-hashable-1.2.7.0-1.cabal::https://hackage.haskell.org/package/hashable-1.2.7.0/revision/1.cabal
        haskell-hashable-1.2.7.0.tar.gz::https://hackage.haskell.org/package/hashable-1.2.7.0/hashable-1.2.7.0.tar.gz
        haskell-hoauth2-1.7.2.tar.gz::https://hackage.haskell.org/package/hoauth2-1.7.2/hoauth2-1.7.2.tar.gz
        haskell-hourglass-0.2.12.tar.gz::https://hackage.haskell.org/package/hourglass-0.2.12/hourglass-0.2.12.tar.gz
        haskell-hslogger-1.2.12.tar.gz::https://hackage.haskell.org/package/hslogger-1.2.12/hslogger-1.2.12.tar.gz
        haskell-hslua-1.0.1.tar.gz::https://hackage.haskell.org/package/hslua-1.0.1/hslua-1.0.1.tar.gz
        haskell-hslua-module-text-0.2.0.tar.gz::https://hackage.haskell.org/package/hslua-module-text-0.2.0/hslua-module-text-0.2.0.tar.gz
        haskell-html-1.0.1.2.tar.gz::https://hackage.haskell.org/package/html-1.0.1.2/html-1.0.1.2.tar.gz
        haskell-http-client-0.5.13.1.tar.gz::https://hackage.haskell.org/package/http-client-0.5.13.1/http-client-0.5.13.1.tar.gz
        haskell-http-client-tls-0.3.5.3.tar.gz::https://hackage.haskell.org/package/http-client-tls-0.3.5.3/http-client-tls-0.3.5.3.tar.gz
        haskell-http-conduit-2.3.2-1.cabal::https://hackage.haskell.org/package/http-conduit-2.3.2/revision/1.cabal
        haskell-http-conduit-2.3.2.tar.gz::https://hackage.haskell.org/package/http-conduit-2.3.2/http-conduit-2.3.2.tar.gz
        haskell-http-types-0.12.2.tar.gz::https://hackage.haskell.org/package/http-types-0.12.2/http-types-0.12.2.tar.gz
        haskell-hxt-9.3.1.16.tar.gz::https://hackage.haskell.org/package/hxt-9.3.1.16/hxt-9.3.1.16.tar.gz
        haskell-hxt-charproperties-9.2.0.1.tar.gz::https://hackage.haskell.org/package/hxt-charproperties-9.2.0.1/hxt-charproperties-9.2.0.1.tar.gz
        haskell-hxt-regex-xmlschema-9.2.0.3.tar.gz::https://hackage.haskell.org/package/hxt-regex-xmlschema-9.2.0.3/hxt-regex-xmlschema-9.2.0.3.tar.gz
        haskell-hxt-unicode-9.0.2.4.tar.gz::https://hackage.haskell.org/package/hxt-unicode-9.0.2.4/hxt-unicode-9.0.2.4.tar.gz
        haskell-integer-logarithms-1.0.2.2.tar.gz::https://hackage.haskell.org/package/integer-logarithms-1.0.2.2/integer-logarithms-1.0.2.2.tar.gz
        haskell-json-0.9.2.tar.gz::https://hackage.haskell.org/package/json-0.9.2/json-0.9.2.tar.gz
        haskell-memory-0.14.18-1.cabal::https://hackage.haskell.org/package/memory-0.14.18/revision/1.cabal
        haskell-memory-0.14.18.tar.gz::https://hackage.haskell.org/package/memory-0.14.18/memory-0.14.18.tar.gz
        haskell-microlens-0.4.9.1.tar.gz::https://hackage.haskell.org/package/microlens-0.4.9.1/microlens-0.4.9.1.tar.gz
        haskell-mime-types-0.1.0.8.tar.gz::https://hackage.haskell.org/package/mime-types-0.1.0.8/mime-types-0.1.0.8.tar.gz
        haskell-monad-control-1.0.2.3.tar.gz::https://hackage.haskell.org/package/monad-control-1.0.2.3/monad-control-1.0.2.3.tar.gz
        haskell-mono-traversable-1.0.9.0.tar.gz::https://hackage.haskell.org/package/mono-traversable-1.0.9.0/mono-traversable-1.0.9.0.tar.gz
        haskell-network-2.7.0.2-2.cabal::https://hackage.haskell.org/package/network-2.7.0.2/revision/2.cabal
        haskell-network-2.7.0.2.tar.gz::https://hackage.haskell.org/package/network-2.7.0.2/network-2.7.0.2.tar.gz
        haskell-network-info-0.2.0.10.tar.gz::https://hackage.haskell.org/package/network-info-0.2.0.10/network-info-0.2.0.10.tar.gz
        haskell-network-uri-2.6.1.0-1.cabal::https://hackage.haskell.org/package/network-uri-2.6.1.0/revision/1.cabal
        haskell-network-uri-2.6.1.0.tar.gz::https://hackage.haskell.org/package/network-uri-2.6.1.0/network-uri-2.6.1.0.tar.gz
        haskell-old-locale-1.0.0.7-2.cabal::https://hackage.haskell.org/package/old-locale-1.0.0.7/revision/2.cabal
        haskell-old-locale-1.0.0.7.tar.gz::https://hackage.haskell.org/package/old-locale-1.0.0.7/old-locale-1.0.0.7.tar.gz
        haskell-old-time-1.1.0.3-2.cabal::https://hackage.haskell.org/package/old-time-1.1.0.3/revision/2.cabal
        haskell-old-time-1.1.0.3.tar.gz::https://hackage.haskell.org/package/old-time-1.1.0.3/old-time-1.1.0.3.tar.gz
        haskell-pandoc-2.3.1.tar.gz::https://hackage.haskell.org/package/pandoc-2.3.1/pandoc-2.3.1.tar.gz
        haskell-pandoc-types-1.17.5.1.tar.gz::https://hackage.haskell.org/package/pandoc-types-1.17.5.1/pandoc-types-1.17.5.1.tar.gz
        haskell-pem-0.2.4.tar.gz::https://hackage.haskell.org/package/pem-0.2.4/pem-0.2.4.tar.gz
        haskell-primitive-0.6.4.0-1.cabal::https://hackage.haskell.org/package/primitive-0.6.4.0/revision/1.cabal
        haskell-primitive-0.6.4.0.tar.gz::https://hackage.haskell.org/package/primitive-0.6.4.0/primitive-0.6.4.0.tar.gz
        haskell-random-1.1-1.cabal::https://hackage.haskell.org/package/random-1.1/revision/1.cabal
        haskell-random-1.1.tar.gz::https://hackage.haskell.org/package/random-1.1/random-1.1.tar.gz
        haskell-recaptcha-0.1.0.4.tar.gz::https://hackage.haskell.org/package/recaptcha-0.1.0.4/recaptcha-0.1.0.4.tar.gz
        haskell-regex-base-0.93.2.tar.gz::https://hackage.haskell.org/package/regex-base-0.93.2/regex-base-0.93.2.tar.gz
        haskell-regex-compat-0.95.1.tar.gz::https://hackage.haskell.org/package/regex-compat-0.95.1/regex-compat-0.95.1.tar.gz
        haskell-regex-pcre-builtin-0.94.4.8.8.35.tar.gz::https://hackage.haskell.org/package/regex-pcre-builtin-0.94.4.8.8.35/regex-pcre-builtin-0.94.4.8.8.35.tar.gz
        haskell-regex-posix-0.95.2.tar.gz::https://hackage.haskell.org/package/regex-posix-0.95.2/regex-posix-0.95.2.tar.gz
        haskell-resourcet-1.2.1.tar.gz::https://hackage.haskell.org/package/resourcet-1.2.1/resourcet-1.2.1.tar.gz
        haskell-safe-0.3.17.tar.gz::https://hackage.haskell.org/package/safe-0.3.17/safe-0.3.17.tar.gz
        haskell-scientific-0.3.6.2.tar.gz::https://hackage.haskell.org/package/scientific-0.3.6.2/scientific-0.3.6.2.tar.gz
        haskell-semigroups-0.18.5.tar.gz::https://hackage.haskell.org/package/semigroups-0.18.5/semigroups-0.18.5.tar.gz
        haskell-sendfile-0.7.9.tar.gz::https://hackage.haskell.org/package/sendfile-0.7.9/sendfile-0.7.9.tar.gz
        haskell-skylighting-0.7.4.tar.gz::https://hackage.haskell.org/package/skylighting-0.7.4/skylighting-0.7.4.tar.gz
        haskell-skylighting-core-0.7.4.tar.gz::https://hackage.haskell.org/package/skylighting-core-0.7.4/skylighting-core-0.7.4.tar.gz
        haskell-socks-0.5.6.tar.gz::https://hackage.haskell.org/package/socks-0.5.6/socks-0.5.6.tar.gz
        haskell-split-0.2.3.3-1.cabal::https://hackage.haskell.org/package/split-0.2.3.3/revision/1.cabal
        haskell-split-0.2.3.3.tar.gz::https://hackage.haskell.org/package/split-0.2.3.3/split-0.2.3.3.tar.gz
        haskell-streaming-commons-0.2.1.0.tar.gz::https://hackage.haskell.org/package/streaming-commons-0.2.1.0/streaming-commons-0.2.1.0.tar.gz
        haskell-syb-0.7.tar.gz::https://hackage.haskell.org/package/syb-0.7/syb-0.7.tar.gz
        haskell-system-filepath-0.4.14-1.cabal::https://hackage.haskell.org/package/system-filepath-0.4.14/revision/1.cabal
        haskell-system-filepath-0.4.14.tar.gz::https://hackage.haskell.org/package/system-filepath-0.4.14/system-filepath-0.4.14.tar.gz
        haskell-tagged-0.8.6.tar.gz::https://hackage.haskell.org/package/tagged-0.8.6/tagged-0.8.6.tar.gz
        haskell-tagsoup-0.14.7.tar.gz::https://hackage.haskell.org/package/tagsoup-0.14.7/tagsoup-0.14.7.tar.gz
        haskell-temporary-1.3.tar.gz::https://hackage.haskell.org/package/temporary-1.3/temporary-1.3.tar.gz
        haskell-texmath-0.11.1.1-1.cabal::https://hackage.haskell.org/package/texmath-0.11.1.1/revision/1.cabal
        haskell-texmath-0.11.1.1.tar.gz::https://hackage.haskell.org/package/texmath-0.11.1.1/texmath-0.11.1.1.tar.gz
        haskell-tf-random-0.5.tar.gz::https://hackage.haskell.org/package/tf-random-0.5/tf-random-0.5.tar.gz
        haskell-th-abstraction-0.2.8.0-1.cabal::https://hackage.haskell.org/package/th-abstraction-0.2.8.0/revision/1.cabal
        haskell-th-abstraction-0.2.8.0.tar.gz::https://hackage.haskell.org/package/th-abstraction-0.2.8.0/th-abstraction-0.2.8.0.tar.gz
        haskell-th-lift-0.7.11.tar.gz::https://hackage.haskell.org/package/th-lift-0.7.11/th-lift-0.7.11.tar.gz
        haskell-th-lift-instances-0.1.11.tar.gz::https://hackage.haskell.org/package/th-lift-instances-0.1.11/th-lift-instances-0.1.11.tar.gz
        haskell-threads-0.5.1.6.tar.gz::https://hackage.haskell.org/package/threads-0.5.1.6/threads-0.5.1.6.tar.gz
        haskell-time-compat-0.1.0.3.tar.gz::https://hackage.haskell.org/package/time-compat-0.1.0.3/time-compat-0.1.0.3.tar.gz
        haskell-time-locale-compat-0.1.1.5.tar.gz::https://hackage.haskell.org/package/time-locale-compat-0.1.1.5/time-locale-compat-0.1.1.5.tar.gz
        haskell-tls-1.4.1.tar.gz::https://hackage.haskell.org/package/tls-1.4.1/tls-1.4.1.tar.gz
        haskell-transformers-base-0.4.5.2.tar.gz::https://hackage.haskell.org/package/transformers-base-0.4.5.2/transformers-base-0.4.5.2.tar.gz
        haskell-transformers-compat-0.6.2.tar.gz::https://hackage.haskell.org/package/transformers-compat-0.6.2/transformers-compat-0.6.2.tar.gz
        haskell-typed-process-0.2.3.0.tar.gz::https://hackage.haskell.org/package/typed-process-0.2.3.0/typed-process-0.2.3.0.tar.gz
        haskell-unliftio-core-0.1.2.0-1.cabal::https://hackage.haskell.org/package/unliftio-core-0.1.2.0/revision/1.cabal
        haskell-unliftio-core-0.1.2.0.tar.gz::https://hackage.haskell.org/package/unliftio-core-0.1.2.0/unliftio-core-0.1.2.0.tar.gz
        haskell-unordered-containers-0.2.9.0.tar.gz::https://hackage.haskell.org/package/unordered-containers-0.2.9.0/unordered-containers-0.2.9.0.tar.gz
        haskell-uri-0.1.6.4.tar.gz::https://hackage.haskell.org/package/uri-0.1.6.4/uri-0.1.6.4.tar.gz
        haskell-uri-bytestring-0.3.2.0.tar.gz::https://hackage.haskell.org/package/uri-bytestring-0.3.2.0/uri-bytestring-0.3.2.0.tar.gz
        haskell-uri-bytestring-aeson-0.1.0.6.tar.gz::https://hackage.haskell.org/package/uri-bytestring-aeson-0.1.0.6/uri-bytestring-aeson-0.1.0.6.tar.gz
        haskell-url-2.1.3.tar.gz::https://hackage.haskell.org/package/url-2.1.3/url-2.1.3.tar.gz
        haskell-utf8-string-1.0.1.1-3.cabal::https://hackage.haskell.org/package/utf8-string-1.0.1.1/revision/3.cabal
        haskell-utf8-string-1.0.1.1.tar.gz::https://hackage.haskell.org/package/utf8-string-1.0.1.1/utf8-string-1.0.1.1.tar.gz
        haskell-uuid-1.3.13-2.cabal::https://hackage.haskell.org/package/uuid-1.3.13/revision/2.cabal
        haskell-uuid-1.3.13.tar.gz::https://hackage.haskell.org/package/uuid-1.3.13/uuid-1.3.13.tar.gz
        haskell-uuid-types-1.0.3-1.cabal::https://hackage.haskell.org/package/uuid-types-1.0.3/revision/1.cabal
        haskell-uuid-types-1.0.3.tar.gz::https://hackage.haskell.org/package/uuid-types-1.0.3/uuid-types-1.0.3.tar.gz
        haskell-vector-0.12.0.1-3.cabal::https://hackage.haskell.org/package/vector-0.12.0.1/revision/3.cabal
        haskell-vector-0.12.0.1.tar.gz::https://hackage.haskell.org/package/vector-0.12.0.1/vector-0.12.0.1.tar.gz
        haskell-vector-algorithms-0.8.0.0-1.cabal::https://hackage.haskell.org/package/vector-algorithms-0.8.0.0/revision/1.cabal
        haskell-vector-algorithms-0.8.0.0.tar.gz::https://hackage.haskell.org/package/vector-algorithms-0.8.0.0/vector-algorithms-0.8.0.0.tar.gz
        haskell-void-0.7.2.tar.gz::https://hackage.haskell.org/package/void-0.7.2/void-0.7.2.tar.gz
        haskell-x509-1.7.4-1.cabal::https://hackage.haskell.org/package/x509-1.7.4/revision/1.cabal
        haskell-x509-1.7.4.tar.gz::https://hackage.haskell.org/package/x509-1.7.4/x509-1.7.4.tar.gz
        haskell-x509-store-1.6.6.tar.gz::https://hackage.haskell.org/package/x509-store-1.6.6/x509-store-1.6.6.tar.gz
        haskell-x509-system-1.6.6.tar.gz::https://hackage.haskell.org/package/x509-system-1.6.6/x509-system-1.6.6.tar.gz
        haskell-x509-validation-1.6.10-1.cabal::https://hackage.haskell.org/package/x509-validation-1.6.10/revision/1.cabal
        haskell-x509-validation-1.6.10.tar.gz::https://hackage.haskell.org/package/x509-validation-1.6.10/x509-validation-1.6.10.tar.gz
        haskell-xml-1.3.14.tar.gz::https://hackage.haskell.org/package/xml-1.3.14/xml-1.3.14.tar.gz
        haskell-xml-conduit-1.8.0.1.tar.gz::https://hackage.haskell.org/package/xml-conduit-1.8.0.1/xml-conduit-1.8.0.1.tar.gz
        haskell-xml-types-0.3.6.tar.gz::https://hackage.haskell.org/package/xml-types-0.3.6/xml-types-0.3.6.tar.gz
        haskell-xss-sanitize-0.3.6.tar.gz::https://hackage.haskell.org/package/xss-sanitize-0.3.6/xss-sanitize-0.3.6.tar.gz
        haskell-zip-archive-0.3.3.tar.gz::https://hackage.haskell.org/package/zip-archive-0.3.3/zip-archive-0.3.3.tar.gz
        haskell-zlib-0.6.2.tar.gz::https://hackage.haskell.org/package/zlib-0.6.2/zlib-0.6.2.tar.gz)
sha256sums=('ae087b359ff2945a62b671449227e0a811d143ee651179f4e7e9c66548e0f514'
            '77b7daec5a79ade779706748f11b4d9b8f805e57a68e7406c3b5a1dee16e0c2f'
            '3a77853eba3700c5346cd6d4008302e70dca93a7e8ac0d679cf41b16c7a4c9e8'
            '4f4ea4aa2e45e7c45821b87b0105c201fbadebc2f2d00c211e728403a0af6b0e'
            '64cec3004a3f005d709a7a1304d3e256a07c58372f7195950ff364e337301181'
            'a3ff6a9c93771079121083f1691188fe45f84380118e0f76bc4578153c361990'
            '7448e6b966e98e84b7627deba23f71b508e9a61e7bc571d74304a25d30e6d0de'
            '74dea1524cb7594aa7a50ebcc3c69235f079ba74d6c26ffce806d094d0ddae4f'
            '5d429433df990bf9b93f9edb3b6d5778bdf0a1bdbfbe36302236eed5fdf70084'
            'dfc8ce4e76e41e2497a765fd98b70bfda5d47d34d42fde9a17231ec571a61288'
            '0925ca46d3cad0dc6d35bdfb28c9bbd065ea7c8fd49aea8c572e846f49605e13'
            '283f2afd46625d98b4e29f77edadfa5e6009a227812ee2ece10091ad6a7e9b71'
            '0b2aa7f5c625b5875c36f5f548926fcdaedf4311bd3a4c291fcf10b8d7faa170'
            '6bd950df6b11a3998bb1452d875d2da043ee43385459afc5f16d471d25178b44'
            '843f302f8186c1ee6e0d9c0630588e4c7fc0f41763333a2d0d4b6f07087a31c4'
            'c1c1ecc5e3abd004a6c4c256ee6f61da2a43d7f1452ffa391dee250df43b27d5'
            '9ef38bbff7e703f964a4c0a1f17b851a6eadcaeffbe01697599eda5a6842a4ba'
            '1e863bfd363f6c3760cc80f2c0d422e17845a9f79fe006030db202ecab5aaf29'
            'c6a328f570c69db73f8d2416f9251e8a03753f90d5d19e76cbe69509a3ceb708'
            '0c571fff4a10559c6a630d4851ba3cdf1d558185ce3dcfca1136f9883d647217'
            '61789382f449a02f827e70a029ba8f24a223b9c6b3792bb094fbd41ee360e851'
            '8f0b86022a1319d3c1c68655790da4b7f98017982e27ec3f3dbfe01029d39027'
            '6a0baba19991e84ef939056e7b411ad3a1ea0fb5e1e8fce7ca50e96c84b206c8'
            'dd93471eb969172cc4408222a3842d867adda3dd7fb39ad8a4df1b121a67d848'
            '0d693707a70bcb553acd133129a9fbca0ea257eeebe714700de3e8fe404a574f'
            'aceec656bfb4222ad3035c3d87d80130b42b595b72888f9ab59c6dbb7ed24817'
            'ab25abf4b00a2f52b270bc3ed43f1d59f16c8eec9d7dffb14df1e9265b233b50'
            '5eaa84a8395afc00751918adbde4db66b05e7126caf20779c0ddf4b94c23bc00'
            'c7f41b97f2b0a71804c3c7d760047dc9adc9734e789084ca1198c4764ce192a4'
            '91fc8b966f3e9dc9461e1675c7566b881740f99abc906495491a3501630bc814'
            'ea0e944298dbbd692b41af4f15dbd1a1574aec7b8f91f38391d25106b143bb1b'
            'c6f0cf8fd707ba8c0b700e0c5ad6a1212c8b57d46a9cbdfb904d8bf585ad82e1'
            '243b34a1b5b64b39e39fe58f75c18f6cad5b668b10cabcd86816cbde27783fe2'
            'f25f5e0992a39371079cc25c2a14b5abb872fa7d868a32753aac3a258b83b1e2'
            'a7ce6d17e50caaa0f19ad8e67361499022860554c521b1e57993759da3eb37e3'
            '7abdaf6d52260e714adcf1c3e16f2e25a56492d90a747d1a9594e15f05acf1c8'
            '67627874c685be09c07edf7ac2a27773ef927b1c4a3faa134a38b0a227ae608d'
            '0f439f00b322ce3d551f28a4dd1520aa2c91d699de4cdc6d485b9b04be0dc5eb'
            'bb741f1650c2c90ef5104489541258689240e750869c9230fd2d458c417d56e9'
            '2c41c925fc53d9ba2e640c7cdca72c492b28c0d45f1a82e94baef8dfa65922ae'
            '70b1f44e8786320c18b26fc5d4ec115fc8ac016ba1f852fa8137f55d785a93eb'
            '3245ed04ae933cf7becede816d1f76043b851472700abf558ae90b28414cc0e3'
            '55c4c6d9660f155cbdd776c610eb2eed503f7116080341d97f35f1da2a11a251'
            '710bd48770fa3e9a3b05428c6dc77fb72c91956d334a1eb89ded11bb843e18f9'
            'd498bcf7d65e6ffe5e99baac58c6d8ae4d29a7f0b2ada8d6115b8c5310636044'
            '3c79af33542512442f8f87f6abb1faef7cd43bbfb2859260a33251d861eb0dab'
            '89be1a18af8730a7bfe4d718d7d5f6ce858e9df93a411566d15bf992db5a3c8c'
            '5ff507bf3863219f41e7f2d215e5511fe15ee13d1e28bd3ee64e0b0b894bcd7a'
            'b0f95d279cd75cacaa8152a01590dc3460f7134f6840b37052abb3ba3cb2a511'
            '4f01b423f000c3e069aaf52a348564a6536797f31498bb85c3db4bd2d0973e56'
            'a55e07af005c9815d82f3fc95e125db82994377c9f4a769428878701d4ec081a'
            '7d683711cbf08abd7adcd5ac2be825381308d220397315a5570fe61b719b5959'
            '60d3b02922958c4908d7bf2b24ddf61511665745f784227d206745784b0c0802'
            '641717eb16392abf8965986a9e8dc21eebf1d97775bbb6923c7b7f8fee17fe11'
            '98a88aa839b40d4aee8b08880030d282d627b63de311f5414dca6e831a951b43'
            '6b0cfb565fc7fa90d71ac56b83aedecf670678e6f1441278877fbf399e9bccbf'
            '510aebda134d1c835250bce8e5e7008fe54a929b05ced6a45121be488935a91c'
            '24f0b79c7e1d25cb2cd44c2258d7a464bf6db8079775b50b60b54a254616b337'
            '31626cabb107a00224da8df21c50b3df42d7f1a66edccfe44bdf551303b9cfcd'
            '4d6ad97e8e3d5dc6ce9ae68a469dc2fd3f66e9d312bc6faa7ab162eddcef87be'
            '6ce5e8801760385a408dab71b53550f87629e661b260bdc2cd41c6a439b6e388'
            '6d5cdb1a5c539425a9665f740e364722e1d9d6ae37fbc55f30fe3dbbbb91d4a2'
            '8d041133f256cd613d45c60ab5244acaea93b13aa0b294d9f4dc8fba15db4a2d'
            '9359a12d3da138ba50fecfc31eed7f92438a6417e9fc3aa17b95a014fa792f17'
            '2ce4e3f57ce62225c3245ed744bfa3edd1820e0def703a02d75a595b61b91b13'
            'ed18df7b53699446dabd66f6e019e5b156820f0301d8dec0d6385f13b797e0ba'
            'afa68fb86123004c37c1dc354286af2d87a9dcfb12ddcb80e8bd0cd55bc87945'
            '54d24975031433f1434602a9a3a1b2faab804e76e594147603500bb97746d149'
            '609f096e7b7d2690fc2302d6a77f6a0e0fefb64ae64e90d90e754dc37f10e740'
            '614a65dd721bfa74ff4e0090e70c4b5c7dfb1fdb6485218b4ce1c5d50509fd61'
            '03b6836ca9cd3ad0e5a2f3cce989b001dd0e05f306a873db3196037adb30e0a4'
            'ecb5efc0586023f5a0dc861100621c1dbb4cbb2f0516829a16ebac39f0432abf'
            '6ed33b88f975e5f8c9b3d6f75f5f86e67e0634bea93495f51ca0a21b427e934e'
            '44335b5c402e80c60f1db6a74462be4ea29d1a9043aa994334ffee1164f1ca4a'
            'f97a4c89d0921f237999de5d44950127dbe8baa177960ccccbfb79cccfd46c7a'
            'ca4e74bbbd6917877bf61e86505d6550603aa62659c2ec8c3780d8be29feb1a0'
            '711705b9befac9b65cc44e13483dc5b6ddcca45bc049813863653276908d8f7e'
            '0c35495ea33d65e69c69bc7441ec8e1af69fbb43433c2aa3406c0a13a3ab3061'
            'e121b5c676aec29f2a3b92dcbbb8b3f6acfad4ac5985141f35e5b739f75bfc6b'
            '471abf8f29a909f40b21eab26a410c0e120ae12ce337512a61dae9f52ebb4362'
            '0f505ab01bdf659831568839ff1f644c498e9993fb20517aaeb9e031327ad93c'
            '7596448325d8b3ad31b2100fe6ba4a3447a470a461cfb7fbcc0bc90a32245ec5'
            '523102d7ba8923e1b399cfd2a1c821e858146ecd934fc147c3acd0fd2b2f9305'
            '0d55e35cc718891d0987b7c8e6c43499efa727c68bc92e88e8b99461dff403e3'
            'e46614d6bf0390b2a6a1aeeb0771e6d366944da40fb21c12c2f8a94d1f47b4d6'
            'f4743ba65498d6001cdfcf5cbc3317d4bc43941be5c7030b60beb83408c892b0'
            '7b5823f3bd94b57022d9d84ab3555303653c5121eaaef2ee1fd4918f3c434466'
            'ba86628d5c14f31fddccea86eeec122ed992af28d5b7ad964b2f5487605e7fc3'
            'e6bb16fa791cc3833ae7b459b7e7885c1c2b11b0d294b7e095287c54fa73738e'
            'f55301417e1c5a43b055d1f0d3e88abe895d15a3e9d49889af634fb4b7028d40'
            'f5458d170a291788ac8da896bb44b0cc84021c99dd596c52adf2f7a7f6c03507'
            'a1401c6f92c142bafea4cf58a1d99cc34af285df808b97f5b64af4bb81fb5648'
            'a88b14a27cb03a0193b1d7afdbfcded82f3aff3eec2e20fd3f41794190a08c91'
            '6c1034189d237ae45368c70f0e68f714dd3beda715dd265b6c8a99fcc64022b1'
            '4adf52e3c3ddd3dfd5d570279bccb4b2a66305175c160e440ef36edf809e0005'
            '7cb8d7bc2080be946cf87890c807b12dae9c59314fa030b2687999100ce60512'
            '6e0b1d86a3377512d8169865ad0a66e8092691fa460993ed7fe1057e3e674dbb'
            '5680f6975d34cf4f81fa7ca0c8efd682261d6a1119e06dece0f67c7bd97fd52a'
            '62cc45c66023e37ef921d5fb546aca56a9c786615e05925fb193a70bf0913690'
            '423e0a2351236f3fcfd24e39cdbc38050ec2910f82245e69ca72a661f7fc47f0'
            'fa998be2c7e00cd26a6e9075bea790caaf3932caa3e9497ad69bc20380dd6911'
            'dbaf8bf6b888fb98845705079296a23c3f40ee2f449df7312f7f7f1de18d7b50'
            'c91fbb3ee73d20ccd015842b30f1f29a304893ebe0ae3128b7bbc13d5bb0d4c8'
            '1ccb158b0f7851715d36b757c523b026ca1541e2030d02239802ba39b4112bc1'
            '7451873d6b564e25f1def0444deb513e210466966e8318d57d7e146f7145c3f1'
            '271cebd0300e236000c2352d597afe2e72a65bc7b01e32b623e2c868fd12dbe0'
            '770c4c1b9cd24b3db7f511f8a48404a0d098999e28573c3743a8a296bb96f8d4'
            '5b6a2c3cc70a35aabd4565fcb9bb1dd78fe2814a36e62428a9a1aae8c32441a1'
            '4cbeaf7924dd79221f327ea101a29bf35c4976dc3319df157ff46ea68e6a0c64'
            '7b67624fd76ddf97c206de0801dc7e888097e9d572974be9b9ea6551d76965df'
            'b718a41057e25a3a71df693ab0fe2263d492e759679b3c2fea6ea33b171d3a5a'
            'a26172c3f5797e402de95b92edcb56a828cb791849b92b4238683446c970430d'
            '20dc5713a16f3d5e2e6d056b4beb9cfdc4368cd09fd56f47414c847705243278'
            'd57cb1a5a4d66753b18eaa37a1621246f660472243b001894f970037548d953b'
            '0bd1b695de953ba4b6e6e0de007021c346cb2a6c8e09356fbcd34f8a79d2ea78'
            '56019921cd4a4c9682b81ec614236fea816ba8ed8785a1640cd66d8b24fc703e'
            'e765c12a6ec0f70efc3c938750060bc17569b99578aa635fd4da0c4d06fcf267'
            '79c5c41e7151906969133ea21af9f7e8d25c18315886e23d0bdf6faa8b537e5c'
            '278d0afc87450254f8a76eab21b5583af63954efc9b74844a17a21a68013140f'
            'ab2a96af6e81e31b909c37ba65f436f1493dbf387cfe0de10b6586270c4ce29d'
            '102fdf6db8c00f5a5981c6eed5acba1368a2d79b2970ce5b22ceb180aa0fdc42'
            'e298417c8044e7e3f2c79bdef23ad7f30ae66855ebd8f545ae5a939a83d82c70'
            '80ba354586b80cde6b1756c6eefe13f324cc6c0e22c793be53fe15cb126e8dab'
            'fa63cd838025e18864c59755750c0cfc4ea76e140a542f07a5c682488ec78438'
            'f1c7b12865e38d1e241ceef74c85eb81d82301022fea1a5012d8d9803af5e26f'
            '1dcd674f7c5f276f33300f5fd59e49d1ac6fc92ae949fd06a0f6d3e9d9ac1413'
            'd8d1fe588924479ea7eefce8c6af77dfb373ee6bde7f4691bdfcbd782b36d68d'
            'b8757dce5ab4045c49a0ae90407d575b87ee5523a7dd5dfa5c9d54fcceff42b5'
            'e8ce7d24d7008a825e5d03aa672950a0e8178ac54c3de7134f36c3a7e37694a2'
            '1656ce3c0d585650784ceb3f794748286e19fb635f557e7b29b0897f8956d993'
            'ad16def0884cf6f05ae1ae8e90192cf9d8d9673fa264b249499bd9e4fac791dd'
            '9980f28169dd0ee8d9e0a65d553044d9bb24c6f2c7e5f6cf0a53dbd25cf1ec25'
            '8c442993694b5ffca823ce864af95bd2841fb5264ee511c61cf48cc71d879890'
            '26cd9f867f31466af1d0a27ff5e7c535a929f3b7fba50a936c1c6441dea5801c'
            'c6f5a6dc010d23c2c38dc4fbc62d7c36d3d1c80d5ceb6a0e4b472b8278f4dbeb'
            '2e30cec027b313c9e1794d326635d8fc5f79b6bf6e7580ab4b00186dadc88510'
            'db5a2ee91cce9afbe7e251c925c2d2b78725b515f6655eb5079aaeeb935c247b'
            'ca136bd3fa76230a288ba0a3a65c36a555f32c179369a258b4a04d2f30e12758'
            'd53cd1479d3cf35c513095f3954eee539e73c55266cec5f1fa0a82d53f30238c'
            '1da46afabdc73c86f279a0557d5a8f9af1296f9f6043264ba354b1c9cc65a6b8'
            '139ac3c067fcbb392b5b9c2feaa98184b75ebe7f2e580726eea6ce812d94562e'
            '590711214510c0d2d09780c7fe3b21748bc4802e9053f78ccd6658e951fe0f7f'
            '07ff1566de7d851423a843b2de385442319348c621d4f779b3d365ce91ac502c'
            'bbead1afc0b808bd5cff7bddaeae84ade37f18bbe72bd78d45a2fa4ac41908f8'
            'd0c80c63fdce6a077dd8eda4f1ff289b85578703a3f1272e141d400fe23245e8'
            'dc06228b7b8a546f9d257b4fe2b369fc2cb279240bbe4312aa8f47bb2752e4be'
            'c0dea5591a4730d151d5c146685d0fa3db1f390d2a63be70a981209e58de6648'
            '49d43dc863d14d89d91a676a968cea8d9f0030ad6ac95768747a44d0d273dd68'
            '24c38b3d610ca2642ed496d1de3d7b6b398ce0410aa0a15f3c7ce636ba8f7a78'
            '6730cb5c4a3e953e2c199d6425be08fd088ff0089a3e140d63226c052e318250'
            'a90cd3d3ca1d33740dc732f14773266a7707901a872747a6e543129cab4ee409'
            'acecd68b9d3128d6b6de99580664ab1e7cbaa0e7722e50c5fc67ccbd7c9104e0'
            'd8bd5f0772e8f45a7530b8b4422102ab24a896ac75611a3c36a02a56dffcef0a'
            '5af27e3f8c0a27e52d0dcb98ef06a0fdd01efe8bb21242c29432e1bc380a4f61'
            '68cc6cf665e7212334a51b63d6936daeaca023b2cfe8637d130acfe95f91700b'
            'fb0b9e3acbe0605bcd1c63e51f290a7bbbe6628dfa3294ff453e4235fbaef140'
            '29837f637a856d2e04dc6f630c1a441eed99edea1695b1b52ccb4d290c2e2854'
            'dfac808a7026217d018b408eab18facc6a85c6183be308d4ac7877e80599b027'
            '01887ed945e74c3c361b00700bd9aeead37d1124d39c0d4f190f89fb0e909c47'
            '9276517ab24a9b06f39d6e3c33c6c2b4ace1fc2126dbc1cd9806866a6551b3fd'
            '3d644fff350ee3eee2896e4d00cb45e73956f2862f0b18ee502282702682b978'
            'b100ee79b9da2651276278cd3e0f08a3c152505cc52982beda507515af173d7b'
            '37e67dde4117490fcfa0d365e252b8092d0ce3a1231927f41c5abf83d33a2367'
            'd7a2c0e9fdb9f9286db0ca69cc1e515e228ec3359bb0149af84e6a274aa4f1b3'
            'd3fffe66a03e4b53db1e459edf75ad8402385a817cae415d857ec0b03ce0cf2b'
            'dfc5cc9617dc084c5560dff230644da009e1a63dd71bc954f5c8a210e4ff3f5d'
            '279c8ac27b11c1cc6694699f0394cf6eb84af98287d7550cf6acdb83418ea1ee'
            '6a276f595cf91c9688129cad4c9c6be9c349ffc0de22300eeb3dfa6a2b6e7635'
            '40dcdaae3ec67f38c08d96d4365b901eb8ac0c590bd7972eb429d37d58aa4419'
            '1c50be76040e7a02b1cf6ca8a2806aa159a47c29c1be212fc161c01736ba4ac7'
            '761c9d77322528259b690508e829cb360feb1fc542951a99f3af51ae980e45d7'
            '32d1a1a9f21a59176d84697f96ae3a13a0198420e3e4f1c48abbab7d2425013d'
            '980b2f13ab8f54d8c2cbf92d186d5fac6c6ead42197c6687bd81e2fea2afef9c'
            '9937d440072552c03c6d8ad79f61e61467dc28dcd5adeaad81038b9b94eef8c9'
            'b385eea5652c798b701c627dce8b327c3d6cbfd8c92e1e18e7118862d4d0e2b4'
            '988adee77c806e0b497929b24d5526ea68bd3297427da0d0b30b99c094efc84d'
            '0dcc7d925769bdbeb323f83b66884101084167501f11d74d21eb9bc515707fed'
            '47c80a32d8f02838a2401414c94ba260d1fe82b7d090479994522242c767cc83')
noextract=("${source[@]%%::*}")
source=("${source[@]}" "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-$CARCH-deb9-linux.tar.xz")

prepare() {
    unset CABAL_SANDBOX_CONFIG CABAL_SANDBOX_PACKAGE_PATH GHC_PACKAGE_PATH
    (
        cd ghc-8.4.4
        ./configure --prefix="$srcdir/.local"
        make install
    )
    mkdir -p .cabal
    cat >.cabal/config <<EOF
with-compiler: $srcdir/.local/bin/ghc
jobs: \$ncpus
EOF
    cabal --config=.cabal/config sandbox init
    rm -f .cabal-sandbox/packages/00-index.tar
    for tar in haskell-*.tar.gz; do (
        cd .cabal-sandbox/packages
        tar_stem=${tar%.tar.gz}
        name=${tar_stem%-*}
        name=${name#haskell-}
        ver=${tar_stem##*-}
        mkdir -p "$name/$ver"
        ln -fs "../../../../$tar" "$name/$ver/$name-$ver.tar.gz"
        for f in "../../haskell-$name-$ver-"*.cabal; do
            if [ -f "$f" ]; then
                cp -p "$f" "$name/$ver/$name.cabal"
            fi
        done
        [ -f "$name/$ver/$name.cabal" ] || {
            tar -xzf "$name/$ver/$name-$ver.tar.gz" "$name-$ver/$name.cabal"
            mv "$name-$ver/$name.cabal" "$name/$ver/$name.cabal"
        }
        tar -uf 00-index.tar "$name/$ver/$name.cabal"
    ) done
    tar -xzf "haskell-gitit-$pkgver.tar.gz" "gitit-$pkgver/LICENSE"
}

build() {
    unset CABAL_SANDBOX_CONFIG CABAL_SANDBOX_PACKAGE_PATH GHC_PACKAGE_PATH
    cabal --config=.cabal/config install --enable-relocatable --force-reinstalls --datadir='$prefix/share/gitit' --docdir='$prefix/share/doc/$abi/$pkgid' --ghc-options=-rtsopts gitit
}

package() {
    mkdir -p "$pkgdir/usr/share"
    cp -PR .cabal-sandbox/share/gitit "$pkgdir/usr/share/"
    rm -fr "$pkgdir/usr/share/gitit/man"
    install -Dm755 .cabal-sandbox/bin/gitit "$pkgdir/usr/bin/gitit"
    install -Dm644 "gitit-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/gitit/LICENSE"
}
