# libinput-no-hysteresis

> Input device management and event handling library sans hysteresis

Hysteresis is the minimum distance required to generate motion events. libinput's default is 0.5mm. On some input devices (touchpads), this threshold is too high, which results in jitters on precise cursor movement.

The included patch disables hysteresis entirely.

Follow along on on the upstream issue: [Bug 98839 - Somehow conditionalize hysteresis (hardware black/whitelist, device property introspection, user-exposed setting, etc)](https://bugs.freedesktop.org/show_bug.cgi?id=98839).
