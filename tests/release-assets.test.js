import { readdirSync } from "node:fs";
import { describe, it, expect } from "vitest";

describe("release package", () => {
  it("contains every documented archive input with the correct case on Linux", () => {
    const names = readdirSync(new URL("../", import.meta.url));
    for (const file of ["src", "package.json", "README.md", "RELEASE-MANAGEMENT.md"]) {
      expect(names).toContain(file);
    }
  });
});
