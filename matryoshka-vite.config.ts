// SPDX-License-Identifier: 0BSD
import tailwindcss from '@tailwindcss/vite';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import { runtimeModules } from './runtime-modules.js';

export default defineConfig({
  plugins: [tailwindcss(), sveltekit(), runtimeModules()],
});
