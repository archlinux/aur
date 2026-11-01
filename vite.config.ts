import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import tailwindcss from "@tailwindcss/vite";
import { runtimeModules } from "./runtime-modules.js";

export default defineConfig({
    plugins: [svelte(), tailwindcss(), runtimeModules()],
    base: "",
});
