# brother-hll1222

Arch package for Brother HL-L1222 CUPS/LPR drivers (v4.4.0-2).

Wraps Brother's x86_64 RPM — no vendor `install.sh`.

## Install

```bash
cd ~/Documents/packages/brother-hll1222
makepkg -si
```

## What gets installed

| Path | Content |
|------|---------|
| `/opt/brother/Printers/HLL1222/` | Brother tree (filters, PPD, binaries) |
| `/usr/lib/cups/filter/brother_lpdwrapper_HLL1222` | → cupswrapper `lpdwrapper` |
| `/usr/share/cups/model/Brother/brother-HLL1222-cups-en.ppd` | CUPS PPD |

## Add a printer

1. USB or network.
2. http://localhost:631 → Administration → Add Printer, or `system-config-printer`.
3. Model: **Brother HL-L1222 for CUPS**.

## Source

- RPM: https://download.brother.com/welcome/dlf106419/hll1222pdrv-4.4.0-2.x86_64.rpm
- Support: https://support.brother.com/
