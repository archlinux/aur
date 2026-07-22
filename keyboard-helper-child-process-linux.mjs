import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const koffi = require("koffi");
const libraryPath = process.env.KEYBOARD_HELPER_LIB_PATH;

if (!libraryPath) throw new Error("KEYBOARD_HELPER_LIB_PATH is not set");

const library = koffi.load(libraryPath);
const callbackType = koffi.proto(
  "bool KeyboardCallback(int32_t, int32_t, int32_t, char*)",
);
const updateTargetShortcuts = library.func("updateTargetShortcuts", "void", ["char*"]);
const resetPressingKeycodes = library.func("resetPressingKeycodes", "void", []);
const startNativeMonitor = library.func("startMonitor", "bool", [koffi.pointer(callbackType)]);
const processNativeEvents = library.func("processEvents", "void", []);
const stopNativeMonitor = library.func("stopMonitor", "void", []);
const setWatcherInterval = library.func("setWatcherInterval", "void", ["double"]);
const getKeyboardLayoutInfo = library.func("getKeyboardLayoutInfo", "string", ["bool"]);
const getKeyboardDeviceList = library.func("getKeyboardDeviceList", "string", []);

let monitoring = false;
let eventTimer = null;
let lastKeysSignature = "";
let shuttingDown = false;

function send(message) {
  if (!process.connected || typeof process.send !== "function") return;
  try {
    process.send(message);
  } catch {}
}

function errorMessage(error) {
  return error instanceof Error ? error.message : String(error);
}

const callback = koffi.register((keyCode, isKeyDown, _reserved, json) => {
  let keys = [];
  try {
    const parsed = JSON.parse(json || "[]");
    if (Array.isArray(parsed)) {
      keys = parsed.map((key) => ({
        keyCode: key.keyCode,
        keyName: key.keyName,
        enKeyName: key.enKeyName,
        isKeydown: true,
        isBlocked: false,
      }));
    }
  } catch {}

  const signature = JSON.stringify(keys.map((key) => [key.keyCode, key.keyName]));
  if (signature === lastKeysSignature) return true;
  lastKeysSignature = signature;
  setImmediate(() => send({
    type: "keyboard-event",
    payload: { pressingKeys: keys, timestamp: Date.now(), keyCode, isKeyDown },
  }));
  return true;
}, koffi.pointer(callbackType));

function start(shortcuts) {
  if (monitoring) return;
  try {
    if (shortcuts) updateTargetShortcuts(JSON.stringify(shortcuts));
    if (!startNativeMonitor(callback)) throw new Error("native monitor refused to start");
    monitoring = true;
    eventTimer = setInterval(() => {
      try {
        processNativeEvents();
      } catch (error) {
        send({ type: "error", payload: { message: errorMessage(error) } });
      }
    }, 2);
    send({ type: "status", payload: { isRunning: true } });
  } catch (error) {
    send({ type: "error", payload: { message: `Failed to start keyboard monitor: ${errorMessage(error)}` } });
  }
}

function stop() {
  if (eventTimer) {
    clearInterval(eventTimer);
    eventTimer = null;
  }
  if (monitoring) {
    try {
      stopNativeMonitor();
    } catch (error) {
      send({ type: "error", payload: { message: `Failed to stop keyboard monitor: ${errorMessage(error)}` } });
    }
  }
  monitoring = false;
  lastKeysSignature = "";
  send({ type: "status", payload: { isRunning: false } });
}

function parseJsonResult(value, fallback) {
  try {
    return JSON.parse(value);
  } catch {
    return fallback;
  }
}

function shutdown(exitCode = 0) {
  if (shuttingDown) return;
  shuttingDown = true;
  stop();
  try {
    koffi.unregister(callback);
  } catch {}
  process.exit(exitCode);
}

process.on("message", (message) => {
  try {
    switch (message?.type) {
      case "start":
        start(message.payload?.shortcuts);
        break;
      case "stop":
        stop();
        break;
      case "setTargetShortcuts":
        updateTargetShortcuts(JSON.stringify(message.payload ?? []));
        break;
      case "resetPressingKeycodes":
        resetPressingKeycodes();
        lastKeysSignature = "";
        send({ type: "keyboard-event", payload: { pressingKeys: [], timestamp: Date.now() } });
        break;
      case "setWatcherInterval":
        if (Number(message.payload) > 0) setWatcherInterval(Number(message.payload));
        break;
      case "getKeyboardLayoutInfo": {
        const layoutInfo = parseJsonResult(
          getKeyboardLayoutInfo(Boolean(message.payload?.needDetail)),
          null,
        );
        send({
          type: "keyboard-layout-info",
          payload: { layoutInfo, requestId: message.payload?.requestId },
        });
        break;
      }
      case "getKeyboardDeviceList":
        send({
          type: "keyboard-device-list",
          payload: { success: true, data: parseJsonResult(getKeyboardDeviceList(), []) },
        });
        break;
      case "destroy":
        shutdown(0);
        break;
    }
  } catch (error) {
    send({ type: "error", payload: { message: errorMessage(error), stack: error?.stack } });
  }
});

process.on("disconnect", () => shutdown(0));
process.on("SIGINT", () => shutdown(0));
process.on("SIGTERM", () => shutdown(0));

send({ type: "ready" });
