# mpv

## Rebuild on ffmpeg new release

`mpv` may require a rebuild on `ffmpeg` new releases despite no soname bumps. Indeed, while `ffmpeg` patch releases are usually fine, `mpv` showed a need to be rebuilt even on `ffmpeg` minor releases in the past.  
This is due to `ffmpeg` upstream introducing API changes without a soname bump (see [this bug report](https://bugs.kde.org/show_bug.cgi?id=493973) for instance). While this is definitly more of an upstream issue (as in, a soname bump should be introduced to reflect API/ABI changes), it's usually recommended to rebuild `mpv` against new `ffmpeg` (minor / major) releases even if they do not include a soname bump (just out of precaution, to avoid any potential issue).

Note that this is most likely **not** limited to `mpv`, other applications / packages might require the same precaution.
