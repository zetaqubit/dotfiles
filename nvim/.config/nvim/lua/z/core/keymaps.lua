vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local map = vim.keymap.set

-- Dvorak movement keys.
map({ "n", "v", "o" }, "h", "h", { desc = "Move left." })
map({ "n", "v", "o" }, "t", "j", { desc = "Move down." })
map({ "n", "v", "o" }, "n", "k", { desc = "Move up." })
map({ "n", "v", "o" }, "s", "l", { desc = "Move right." })

map({ "n", "v", "o" }, "H", "^", { desc = "Move to start of line." })
map({ "n", "v", "o" }, "T", "<C-d>", { desc = "Move down half a page." })
map({ "n", "v", "o" }, "N", "<C-u>", { desc = "Move up half a page." })
map({ "n", "v", "o" }, "S", "$", { desc = "Move to end of line." })

-- Readline-style insert-mode mappings
-- Use readline.nvim instead
local opts = { noremap = true, silent = true }
map("i", "<C-a>", "<Home>", opts)        -- Beginning of line
map("i", "<C-e>", "<End>", opts)         -- End of line
map("i", "<C-b>", "<Left>", opts)        -- Backward one char
map("i", "<C-f>", "<Right>", opts)       -- Forward one char
-- map("i", "<M-b>", "<Esc>lBi", opts)
-- map("i", "<M-f>", "<Esc>lWi", opts)

-- a b cthnt

-- Deletion
map("i", "<C-d>", "<Del>", opts)         -- Delete character under cursor
map("i", "<C-h>", "<BS>", opts)          -- Backspace (already default)
map("i", "<C-w>", "<C-\\><C-o>db", opts) -- Delete previous word
map("i", "<C-u>", "<C-\\><C-o>d0", opts) -- Delete to beginning of line
map("i", "<C-k>", "<C-\\><C-o>D", opts)  -- Delete to end of line

-- Kill/yank buffer (simulate kill-line)
-- You can also map <C-y> to paste last deleted text if desired
-- map("i", "<C-y>", '<C-r>"', opts)     -- Yank/paste (optional)

-- Make ; behave same as :
map({ "n", "v" }, ";", ":", { desc = "Map ; to :" })
map({ "n", "v", "o" }, ",", ";", { desc = "Repeat f" })
map({ "n", "v", "o" }, "<leader>,", ",", { desc = "Repeat f (reverse)" })

-- Pane navigation
-- map({ "n", "v", "i" }, "<M-h>", "<cmd>NvimTmuxNavigateLeft<cr><esc>", { desc = "Navigate left a pane." })
-- map({ "n", "v", "i" }, "<M-t>", "<cmd>NvimTmuxNavigateDown<cr><esc>", { desc = "Navigate down a pane." })
-- map({ "n", "v", "i" }, "<M-n>", "<cmd>NvimTmuxNavigateUp<cr><esc>", { desc = "Navigate up a pane." })
-- map({ "n", "v", "i" }, "<M-s>", "<cmd>NvimTmuxNavigateRight<cr><esc>", { desc = "Navigate right a pane." })
-- map({ "n", "v", "i" }, "<M-->", "<cmd>NvimTmuxNavigateLastActive<cr><esc>", { desc = "Navigate to previous pane." })

-- Back and forward in jump list
map({ "n", "v" }, "-", "<C-o>", { desc = "Back in the jump list" })
map({ "n", "v" }, "_", "<C-i>", { desc = "Forward in the jump list" })

-- Keys displaced by dvorak movement keys.
map({ "n", "v", "o" }, "j", "n", { desc = "Next search hit." })
map({ "n", "v", "o" }, "k", "N", { desc = "Previous search hit." })

-- Toggle highlights
--   - If search is active, clear it
--   - If no search is active, highlight occurences of current word. (Similar to *, but does not jump)
map("n", "<leader>th", function()
  local hlsearch = vim.o.hlsearch
  local search_pat = vim.fn.getreg('/')

  if hlsearch and search_pat ~= '' then
    -- Disable search highlight
    vim.cmd("nohlsearch")
    vim.fn.setreg('/', '') -- Optionally clear the search register
  else
    -- Set search pattern to <cword> but don't move the cursor
    local word = vim.fn.expand("<cword>")
    if word ~= '' then
      vim.fn.setreg('/', [[\V\<]] .. word .. [[\>]])
      vim.o.hlsearch = true
    end
  end
end, { desc = "Toggle highlight of <cword> without jumping" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Toggle diagnostics
require('z.core.toggle_diagnostics')
map('n', '<leader>td', toggle_diagnostics, { desc = 'Toggle LSP diagnostics' })

