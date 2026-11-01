import { sveltekit } from "@sveltejs/kit/vite";
import { defineConfig } from "vite";
import { fileURLToPath } from "node:url";
import { runtimeModules } from "./q2view-runtime-modules.js";

export default defineConfig({
  plugins: [
    {
      name: "jszip-source-entry",
      enforce: "pre",
      resolveId(id) {
        // Compile the locked source and retain its browser-specific stream map.
        if (id === "jszip") {
          return fileURLToPath(new URL("./node_modules/jszip/lib/index.js", import.meta.url));
        }
      },
    },
    sveltekit(),
    runtimeModules(),
  ],
});
