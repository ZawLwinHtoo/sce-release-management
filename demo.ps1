# ============================================================================
# Demo Script: Pass vs Fail CI Pipeline (PowerShell)
# ============================================================================
# This script demonstrates the two scenarios described in the task:
#   Step A: Working code  -> CI passes  (Green check)
#   Step B: Broken test   -> CI fails   (Red cross) and blocks merge
# ============================================================================

Write-Host ""
Write-Host "============================================"
Write-Host "  CI Pipeline Demo: Pass vs Fail Scenario"
Write-Host "============================================"
Write-Host ""

# -- Step A: Run tests with correct code (should PASS) --
Write-Host "--- STEP A: Running tests with correct code ---" -ForegroundColor Yellow
Write-Host ""

npx vitest run
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "STEP A RESULT: All tests PASSED - CI would show a Green check." -ForegroundColor Green
    Write-Host "   This commit is safe to merge into the mainline baseline." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Unexpected failure in Step A. Check your setup." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "--------------------------------------------"
Write-Host ""

# -- Step B: Introduce a defect and re-run tests (should FAIL) --
Write-Host "--- STEP B: Introducing a deliberate defect ---" -ForegroundColor Yellow
Write-Host ""

$brokenTestFile = "tests\calculateTotal.broken.test.js"

$brokenTestContent = @'
import { describe, it, expect } from "vitest";
import { calculateTotal } from "../src/calculateTotal.js";

describe("calculateTotal - BROKEN TEST (demo)", () => {
  it("deliberately wrong assertion: expects 1 + 1 = 3", () => {
    // This intentionally incorrect test simulates pushing defective code
    const items = [{ price: 1, quantity: 1 }, { price: 1, quantity: 1 }];
    expect(calculateTotal(items)).toBe(3); // Wrong! Actual result is 2
  });
});
'@

Set-Content -Path $brokenTestFile -Value $brokenTestContent -Encoding UTF8

Write-Host "Created broken test file: $brokenTestFile"
Write-Host "The test expects calculateTotal([{price:1,qty:1},{price:1,qty:1}]) to equal 3 (wrong!)."
Write-Host ""

npx vitest run
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "STEP B RESULT: Tests FAILED - CI would show a Red cross." -ForegroundColor Red
    Write-Host "   This defective code is BLOCKED from merging into the baseline." -ForegroundColor Red
} else {
    Write-Host ""
    Write-Host "Tests passed unexpectedly. Something is wrong." -ForegroundColor Red
    Remove-Item -Path $brokenTestFile -Force -ErrorAction SilentlyContinue
    exit 1
}

# Clean up the broken test file
Remove-Item -Path $brokenTestFile -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "============================================"
Write-Host "  Demo complete!" -ForegroundColor Green
Write-Host "  Step A showed a PASSING pipeline (safe to merge)."
Write-Host "  Step B showed a FAILING pipeline (merge blocked)."
Write-Host "============================================"
Write-Host ""
