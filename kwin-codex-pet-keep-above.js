// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD

const trackedWindows = new Set();

function isCodexPet(window) {
  const resourceClass = String(window.resourceClass ?? "").toLowerCase();
  const resourceName = String(window.resourceName ?? "").toLowerCase();
  const geometry = window.frameGeometry;
  const isCodex = resourceClass.includes("codex") || resourceName.includes("codex");

  return (
    isCodex &&
    window.skipTaskbar &&
    geometry != null &&
    geometry.width <= 1024 &&
    geometry.height <= 1024
  );
}

function enforceKeepAbove(window) {
  if (!trackedWindows.has(window)) {
    return;
  }
  if (!window.keepAbove) {
    window.keepAbove = true;
  }
  workspace.raiseWindow(window);
}

function trackWindow(window) {
  if (!isCodexPet(window) || trackedWindows.has(window)) {
    return;
  }

  trackedWindows.add(window);
  window.outputChanged.connect(() => enforceKeepAbove(window));
  window.keepAboveChanged.connect(() => enforceKeepAbove(window));
  window.closed.connect(() => trackedWindows.delete(window));
  enforceKeepAbove(window);
}

function enforceAll() {
  for (const window of trackedWindows) {
    enforceKeepAbove(window);
  }
}

for (const window of workspace.windowList()) {
  trackWindow(window);
}

workspace.windowAdded.connect((window) => {
  trackWindow(window);
  enforceAll();
});
workspace.windowActivated.connect(enforceAll);
