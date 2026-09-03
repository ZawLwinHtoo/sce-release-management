/**
 * Core math/logic functions for CI pipeline demonstration.
 */

/**
 * Calculates the total from an array of item objects.
 * Each item should have a `price` (number) and `quantity` (number).
 *
 * @param {Array<{price: number, quantity: number}>} items
 * @returns {number} The grand total, rounded to 2 decimal places.
 */
export function calculateTotal(items) {
  if (!Array.isArray(items)) {
    throw new TypeError("items must be an array");
  }

  const total = items.reduce((sum, item) => {
    if (typeof item.price !== "number" || typeof item.quantity !== "number") {
      throw new TypeError("Each item must have numeric price and quantity");
    }
    return sum + item.price * item.quantity;
  }, 0);

  return Math.round(total * 100) / 100;
}
