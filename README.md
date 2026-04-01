# Voix - The Keeper of Realms

## Prophecy

Born from the ancient runes of OpenDoas, Voix is a secure, mystical invocation designed to govern the ascension of privileges across your systems. Through the pact of Pluggable Authentication Modules (PAM) and immutable rules, only the worthy are granted the power to traverse higher planes of execution.

"Where `sudo` scatters trust, Voix binds it."

## The Arcane Arts (Features)

- **Ascension by Design**: Execute incantations with elevated privileges only when explicitly ordained by the Elders.
- **The PAM Pact**: Cryptographically secure authentication tied into your realm’s deep foundations.
- **Runes of Clarity**: Configuration is ordained in unmistakable syntax within the `/etc/voix.conf` sanctuary.
- **Seamless Transmutation**: Properly spawns the user's shell environment upon successful ascent.
- **Sanctified Tokens**: Optional time-gated persistence of power, mimicking familiar boons.

## Forging the Artifact

### Prerequisites for the Forge

The Elders command strict adherence to modern crafting:

- **LLVM Clang Toolchain** (Only Clang 21+ is accepted by the forge)
- A **C++26** compliant arcane environment
- **CMake** (v3.18+) and **Ninja**
- Core dependencies: PAM libraries (`libpam0g-dev` / `pam-devel`), `pkg-config`.

### Bringing Forth the Binary

1. **Obtain the Scrolls**:

   ```bash
   git clone https://github.com/Veridian-Zenith/Voix.git && cd Voix
   ```

2. **Ignite the Forge**:

   ```bash
   cmake -B build -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang
   ```

3. **Shape the Artifact**:

   ```bash
   cmake --build build
   ```

4. **Commend it to the System**:

   ```bash
   sudo cmake --install build
   ```

   *Arch Linux users may seek the `voix` package directly from the AUR Archives.*

## First Invocation (Getting Started)

To begin your journey with Voix, you must first configure the PAM pact. Create a new scroll at `/etc/pam.d/voix` and inscribe the following:

```
#%PAM-1.0
auth       include      system-auth
account    include      system-auth
password   include      system-auth
session    include      system-auth
```

With the pact sealed, you may now invoke Voix.

## The Runes of Law (Configuration)

The heart of Voix is defined in `/etc/voix.conf`.

`[ordain|shun] [trust] <ident> [mask <target>] [rite <incantation> [args ...]]`

**Deconstructing the Runes:**

- `ordain|shun`: The primary incantation. `ordain` grants power, while `shun` denies it.
- `trust`: (Optional) A sacred boon that allows the user to execute incantations without re-authenticating for a time.
- `<ident>`: The user or group to apply the rule to. Groups must be prefixed with a colon (`:`), like `:wizards`.
- `mask <target>`: (Optional) The target user to execute the incantation as. Defaults to `root`, the highest of all.
- `rite <incantation>`: (Optional) The specific incantation to be executed. If not specified, the user can execute any incantation.
- `[args ...]`: (Optional) Arguments for the incantation.

**An Offering to the Config:**

```conf
# The High Circle may invoke anything with ritual trust
ordain trust :wheel

# The Initiate may gaze into the system state without a token of proof
ordain trust initiate mask root rite /usr/bin/systemctl

# The apprentice may only restart the mystic server
ordain apprentice mask root rite /usr/bin/systemctl restart magic.service

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

## Consulting the Oracle (Troubleshooting)

**Problem:** "PAM authentication failed"

**Solution:** The pact is broken. Ensure that the PAM scroll at `/etc/pam.d/voix` is correctly inscribed.

**Problem:** "Permission denied"

**Solution:** The runes of law are not in your favor. Consult the `/etc/voix.conf` scroll to ensure you are worthy of the incantation.

## The Architect's Code

Every function, every design, everything is modular, has a use, and is well put-together. If you seek to alter the artifact:

1. Speak exclusively in C++26.
2. Honor the Clang compiler constraints.
3. Bind your work with `clang-tidy` to cleanse any lingering chaos.

## The Final Vow (License)

Voix is sealed and distributed under the Open Software License v3.0 (OSL-3.0). See the `LICENSE` scroll for eternal details.
