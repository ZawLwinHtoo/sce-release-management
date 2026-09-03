/**
 * A minimal application entry point.
 * Used as a sample artefact for the Release Management demo.
 */

export function greet(name = "World") {
  return `Hello, ${name}!`;
}

export const VERSION = "0.0.0-semantically-released";

console.log(greet());
console.log(`Version: ${VERSION}`);
