import { describe, it, expect } from "vitest";
import { calculateTotal } from "../src/calculateTotal.js";

describe("calculateTotal", () => {
  it("returns 0 for an empty array", () => {
    expect(calculateTotal([])).toBe(0);
  });

  it("calculates total for a single item", () => {
    const items = [{ price: 10, quantity: 2 }];
    expect(calculateTotal(items)).toBe(20);
  });

  it("calculates total for multiple items", () => {
    const items = [
      { price: 5.5, quantity: 3 },
      { price: 12, quantity: 1 },
      { price: 3.25, quantity: 4 },
    ];
    // 5.5*3 + 12*1 + 3.25*4 = 16.5 + 12 + 13 = 41.5
    expect(calculateTotal(items)).toBe(41.5);
  });

  it("handles floating point precision correctly", () => {
    const items = [
      { price: 0.1, quantity: 1 },
      { price: 0.2, quantity: 1 },
    ];
    expect(calculateTotal(items)).toBe(0.3);
  });

  it("throws TypeError when input is not an array", () => {
    expect(() => calculateTotal("not-an-array")).toThrow(TypeError);
    expect(() => calculateTotal(null)).toThrow(TypeError);
  });

  it("throws TypeError when item has non-numeric fields", () => {
    const items = [{ price: "ten", quantity: 2 }];
    expect(() => calculateTotal(items)).toThrow(TypeError);
  });
});
