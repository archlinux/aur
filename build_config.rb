MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__
  conf.gem github: 'eagletmt/mitamae-pacman', checksum_hash: 'v0.2.0'
  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'

  conf.gem github: 'IceDragon200/mruby-catch-throw', checksum_hash: '2b6eaff4232b4a9473b864df53c2917080af5dcf' # Latest
  conf.gem github: 'eagletmt/mruby-etc', checksum_hash: 'v0.1.0' # Specified by mitamae
  conf.gem github: 'fastly/mruby-optparse', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89' # Latest
  conf.gem github: 'gromnitsky/mruby-dir-glob', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada' # Latest
  conf.gem github: 'iij/mruby-dir', checksum_hash: '89dceefa1250fb1ae868d4cb52498e9e24293cd1' # Latest
  conf.gem github: 'iij/mruby-env', checksum_hash: '056ae324451ef16a50c7887e117f0ea30921b71b' # Latest
  conf.gem github: 'iij/mruby-errno', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0' # Latest
  conf.gem github: 'iij/mruby-iijson', checksum_hash: 'c5e730c30090d3cddae258f57ab9508edb3e9fce' # Latest
  conf.gem github: 'iij/mruby-pack', checksum_hash: '383a9c79e191d524a9a2b4107cc5043ecbf6190b' # Latest
  conf.gem github: 'iij/mruby-process', checksum_hash: '95da206a5764f4e80146979b8e35bd7a9afd6850' # Latest
  conf.gem github: 'k0kubun/mruby-erb', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-hashie', checksum_hash: 'c69255a94debcd641f2087b569f5625509bde698' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-open3', checksum_hash: 'b7480b6300a81d0e5fac469a36a383518e3dfc78' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-shellwords', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-specinfra', checksum_hash: '95994e41b5d40f50dbf0e10ff20a38bd124fd30c' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-tempfile', checksum_hash: 'e628c8fcb4bca3f3456640a8b56d1ae98c594e24' # Specified by mitamae
  conf.gem github: 'ksss/mruby-at_exit', checksum_hash: '09af1ecdce7b39582023c7614f8305386ee4d789' # Latest
  conf.gem github: 'ksss/mruby-file-stat', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e' # Specified by mitamae
  conf.gem github: 'ksss/mruby-singleton', checksum_hash: '73dd4bae1a47d82e49b8f85bf27f49ec4462052e' # Latest
  conf.gem github: 'mattn/mruby-json', checksum_hash: '054699892b0d681110e7348440cddb70a3fd671e' # Latest
  conf.gem github: 'mattn/mruby-onig-regexp', checksum_hash: 'e55923997ba33586b58c11bd3ca2d40c11a8dede' # Latest
  conf.gem github: 'mrbgems/mruby-yaml', checksum_hash: '0606652a6e99d902cd3101cf2d757a7c0c37a7fd' # Specified by mitamae
  conf.gem github: 'tatsushid/mruby-schash', checksum_hash: 'c8470d4be2404b4cfbb8011daebc2ca9bb1cdb80' # Latest
  conf.gem github: 'zzak/mruby-uri', checksum_hash: 'b3108ae56a48990eb7b79f44aca4ec76e1e60ad8' # Latest
end
