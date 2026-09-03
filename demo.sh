#!/usr/bin/env bash
# ============================================================================
# Demo Script: Pass vs Fail CI Pipeline
# ============================================================================
# This script demonstrates the two scenarios described in the task:
#   Step A: Working code  -> CI passes  (Green check ✅)
#   Step B: Broken test   -> CI fails   (Red cross ❌) and blocks merge
# ============================================================================

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "============================================"
echo "  CI Pipeline Demo: Pass vs Fail Scenario"
echo "============================================"
echo ""

# ── Step A: Run tests with correct code (should PASS) ──────────────────────
echo -e "${YELLOW}━━━ STEP A: Running tests with correct code ━━━${NC}"
echo ""

if npx vitest run 2>&1; then
  echo ""
  echo -e "${GREEN}✅ STEP A RESULT: All tests PASSED — CI would show a Green check.${NC}"
  echo -e "${GREEN}   This commit is safe to merge into the mainline baseline.${NC}"
else
  echo ""
  echo -e "${RED}❌ Unexpected failure in Step A. Check your setup.${NC}"
  exit 1
fi

echo ""
echo "--------------------------------------------"
echo ""

# ── Step B: Introduce a defect and re-run tests (should FAIL) ──────────────
echo -e "${YELLOW}━━━ STEP B: Introducing a deliberate defect ━━━${NC}"
echo ""

TEMP_TEST_FILE="tests/calculateTotal.broken.test.js"

cat > "$TEMP_TEST_FILE" << 'EOF'
import { describe, it, expect } from "vitest";
import { calculateTotal } from "../src/calculateTotal.js";

describe("calculateTotal - BROKEN TEST (demo)", () => {
  it("deliberately wrong assertion: expects 1 + 1 = 3", () => {
    // This intentionally incorrect test simulates pushing defective code
    const items = [{ price: 1, quantity: 1 }, { price: 1, quantity: 1 }];
    expect(calculateTotal(items)).toBe(3); // Wrong! Actual result is 2
  });
});
EOF

echo "Created broken test file: $TEMP_TEST_FILE"
echo "The test expects calculateTotal([{price:1,qty:1},{price:1,qty:1}]) to equal 3 (wrong!)."
echo ""

if npx vitest run 2>&1; then
  echo ""
  echo -e "${RED}❌ Tests passed unexpectedly. Something is wrong.${NC}"
  rm -f "$TEMP_TEST_FILE"
  exit 1
else
  echo ""
  echo -e "${RED}❌ STEP B RESULT: Tests FAILED — CI would show a Red cross.${NC}"
  echo -e "${RED}   This defective code is BLOCKED from merging into the baseline.${NC}"
fi

# Clean up the broken test file
rm -f "$TEMP_TEST_FILE"

echo ""
echo "============================================"
echo -e "  ${GREEN}Demo complete!${NC}"
echo "  Step A showed a PASSING pipeline (safe to merge)."
echo "  Step B showed a FAILING pipeline (merge blocked)."
echo "============================================"
echo ""
