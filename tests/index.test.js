import { describe, it, expect } from "vitest";
import { greet } from "../src/index.js";

describe("greet", () => {
  it("returns default greeting", () => {
    expect(greet()).toBe("Hello, World!");
  });

  it("returns personalised greeting", () => {
    expect(greet("GitHub")).toBe("Hello, GitHub!");
  });
});
