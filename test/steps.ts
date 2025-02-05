import { expect } from '@playwright/test';
import { createBdd } from 'playwright-bdd';

const { Given, When, Then } = createBdd();

Given('I am on home page', async ({ page }) => {
    await page.goto('');
});

When('I click the counter', async ({ page }) => {
    await page.getByRole('button', { name: 'count is' }).click();
});

Then('I see that the counter is {int}', async ({ page }, counter: number) => {
    await expect(page.getByRole('button', { name: 'count is' })).toHaveText(new RegExp(`count is ${counter}`));
});
