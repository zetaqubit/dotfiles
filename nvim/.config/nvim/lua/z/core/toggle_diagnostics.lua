local M = {}

local diagnostics_active = true

-- Toggle diagnostics for the current buffer
function _G.toggle_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()

  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(bufnr)
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable(bufnr)
    print("Diagnostics disabled")
  end
end

-- Auto-disable diagnostics after LSP attaches if user has it disabled
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    if diagnostics_active == false then
      vim.schedule(function()
        vim.diagnostic.disable(bufnr)
      end)
    end
  end,
})

-- Prevent re-enabling diagnostics on change/write if disabled
local events = { "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }
vim.api.nvim_create_autocmd(events, {
  callback = function(args)
    local bufnr = args.buf
    if diagnostics_active == false then
      vim.schedule(function()
        vim.diagnostic.disable(bufnr)
      end)
    end
  end,
})

return M
