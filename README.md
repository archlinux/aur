# Voix - The Keeper of Realms (Arch User Repository)

## Prophecy

Born from the ancient runes of OpenDoas, Voix is a secure, mystical invocation designed to govern the ascension of privileges across your systems. Through the pact of Pluggable Authentication Modules (PAM) and immutable rules, only the worthy are granted the power to traverse higher planes of execution.

"Where `sudo` scatters trust, Voix binds it."

## Arch Linux Ascension (AUR)

This repository contains the sacred PKGBUILD for the Arch Linux planes.

### Installation via AUR Helper

The easiest path to ascension is through your favorite AUR helper:

```bash
yay -S voix
```

### Manual Forge

For those who prefer to build by hand:

```bash
git clone https://aur.archlinux.org/voix.git
cd voix
makepkg -si
```

## The Arcane Arts (Features)

- **Ascension by Design**: Execute incantations with elevated privileges only when explicitly ordained by the Elders.
- **The PAM Pact**: Cryptographically secure authentication tied into your realm’s deep foundations.
- **Runes of Clarity**: Configuration is ordained in unmistakable syntax within the `/etc/voix.conf` sanctuary.
- **Seamless Transmutation**: Properly spawns the user's shell environment upon successful ascent.
- **Sanctified Tokens**: Optional time-gated persistence of power, mimicking familiar boons.

## The Runes of Law (Configuration)

The heart of Voix is defined in `/etc/voix.conf`.

`[ordain|shun] [trust] <ident> [mask <target>] [rite <incantation> [args ...]]`

**An Offering to the Config:**

```conf
# The High Circle may invoke anything with ritual trust
ordain trust :wheel

# The Initiate may gaze into the system state without a token of proof
ordain trust initiate mask root rite /usr/bin/systemctl

# Exiled souls shall remain shunned
shun exiled
```

## Invoking the Power

To cast a command beyond your station:

```bash
voix <incantation> [args...]
```

- `-u USER, --user USER`: Invoke as a specific entity.
- `-n, --non-interactive`: Fail the cast immediately if blood (password) is required.
- `-C, --clear`: Forsake any lingering tokens of power instantly.

## The Final Vow (License)

Voix is sealed and distributed under the Open Software License v3.0 (OSL-3.0). See the core `LICENSE` scroll for eternal details.
