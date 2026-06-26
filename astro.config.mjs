// @ts-check
import { defineConfig } from 'astro/config';
import cloudflare from '@astrojs/cloudflare';

// https://astro.build
export default defineConfig({
  output: 'server', // 👈 ADD THIS LINE HERE
  adapter: cloudflare()
});
