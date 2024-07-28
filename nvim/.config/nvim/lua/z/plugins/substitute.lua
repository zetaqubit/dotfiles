return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "l", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "ll", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "L", substitute.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("x", "l", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
