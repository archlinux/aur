MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__
  conf.gem github: 'eagletmt/mitamae-pacman', checksum_hash: 'v0.2.0'
  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'
  conf.gem github: 'eagletmt/mruby-etc', checksum_hash: 'v0.1.0' # Specified by mitamae
  conf.gem github: 'fastly/mruby-optparse', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89' # Latest
  conf.gem github: 'gromnitsky/mruby-dir-glob', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada' # Latest
  conf.gem github: 'IceDragon200/mruby-catch-throw', checksum_hash: 'b2900a21e71efb4702c2750e6e9312f46d6d2560' # Latest
  conf.gem github: 'iij/mruby-dir', checksum_hash: '89dceefa1250fb1ae868d4cb52498e9e24293cd1' # Latest
  conf.gem github: 'iij/mruby-env', checksum_hash: '056ae324451ef16a50c7887e117f0ea30921b71b' # Latest
  conf.gem github: 'iij/mruby-errno', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0' # Latest
  conf.gem github: 'iij/mruby-io', checksum_hash: '6836f424c5ff95d0114a426010b22254804bc9a3' # Specified by mitamae
  conf.gem github: 'iij/mruby-process', checksum_hash: 'bd288a930d4f61fbda1865deb8997245dc5fd38c' # Latest
  conf.gem github: 'iij/mruby-socket', checksum_hash: 'a8b6d6ee4c6ccea81a805cc9204b36c3792123c9' # Specified by mitamae
  conf.gem github: 'iij/mruby-tempfile', checksum_hash: '41a7e6302ec258e3bf428adb4b84499ded72cef4' # Latest
  conf.gem github: 'k0kubun/mruby-erb', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-hashie', checksum_hash: 'c69255a94debcd641f2087b569f5625509bde698' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-open3', checksum_hash: 'b7480b6300a81d0e5fac469a36a383518e3dfc78' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-shellwords', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-specinfra', checksum_hash: 'efb18feeee0cb8d0d49c7a9eadbc0fc074c2be1c' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-yaml', checksum_hash: 'b0b57f077f7d910516183f14750a3eeee5a7ecbc' # Latest
  conf.gem github: 'ksss/mruby-at_exit', checksum_hash: '09af1ecdce7b39582023c7614f8305386ee4d789' # Latest
  conf.gem github: 'ksss/mruby-file-stat', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e' # Specified by mitamae
  conf.gem github: 'mattn/mruby-json', checksum_hash: '054699892b0d681110e7348440cddb70a3fd671e' # Latest
  conf.gem github: 'mattn/mruby-onig-regexp', checksum_hash: '0667cffa26db180ce3f6ed3b0341e9f30f1ae247' # Latest
  conf.gem github: 'zzak/mruby-uri', checksum_hash: 'b3108ae56a48990eb7b79f44aca4ec76e1e60ad8' # Latest
end
