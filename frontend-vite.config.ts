import { defineConfig, mergeConfig } from 'vite';
import original from './vite.config';
import inventory from './frontend-runtime-inventory';

export default defineConfig(async (env) => {
  const base = typeof original === 'function' ? await original(env) : await original;
  return mergeConfig(base, { plugins: [inventory()] });
});
