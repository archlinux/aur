# omarchy-calculator-git

A minimal calculator app built with the Omarchy theme for Flutter.

This is the development version of omarchy-calculator, built directly from the latest git source.

## Installation

This package is available in the AUR. You can install it using an AUR helper like `yay`:

```bash
yay -S omarchy-calculator-git
```

Or manually:

```bash
git clone https://aur.archlinux.org/omarchy-calculator-git.git
cd omarchy-calculator-git
makepkg -si
```

## Dependencies

- Flutter SDK (build dependency)
- GTK3
- Git (build dependency)

## Provides/Conflicts

- Provides: `omarchy-calculator`
- Conflicts: `omarchy-calculator`

This means you cannot have both the stable and git versions installed simultaneously.

## Source

The source code is automatically cloned from: https://github.com/cakePhone/omarchy_calculator

## Maintainer Notes

### Testing the Package

To test the package locally:

```bash
./aur-helper.sh test
```

### Updating the Package

1. Make changes to the PKGBUILD
2. Update .SRCINFO and commit:
   ```bash
   ./aur-helper.sh update
   ```
3. Push to AUR:
   ```bash
   ./aur-helper.sh push
   ```

### First-time AUR Setup

After cloning this repository, set up the AUR remote:

```bash
./aur-helper.sh setup-aur
```

Make sure you have SSH access to AUR configured with your SSH key uploaded to your AUR account.

## Package Structure

This is a `-git` package that:
- Clones the source code automatically from the main repository
- Uses `pkgver()` function to generate version numbers based on git commits
- Builds using Flutter's Linux build system
- Installs the application to `/usr/share/omarchy-calculator/`
- Creates a wrapper script at `/usr/bin/omarchy-calculator`

## License

MIT License - see LICENSE file in the source repository.
