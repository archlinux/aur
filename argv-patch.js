// strip chromium/electron flags added by ~/.config/electron-flags.conf
const idx = process.argv.indexOf('--');

if (idx !== -1) {
  process.argv = [
    ...process.argv.slice(0, 1),
    ...process.argv.slice(idx + 1),
  ];
}
