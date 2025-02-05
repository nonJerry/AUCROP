import { defineConfig } from '@playwright/test';
import { defineBddConfig } from 'playwright-bdd';

const testDir = defineBddConfig({
    featuresRoot: 'test/features',
    steps: 'test/steps.ts',
});

export default defineConfig({
    testDir,
    reporter: 'html',
    use: {
        baseURL: 'http://localhost:5173',
    }
});
