vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Dvorak movement keys.
keymap.set({ "n", "v", "o" }, "h", "h", { desc = "Move left." })
keymap.set({ "n", "v", "o" }, "t", "j", { desc = "Move down." })
keymap.set({ "n", "v", "o" }, "n", "k", { desc = "Move up." })
keymap.set({ "n", "v", "o" }, "s", "l", { desc = "Move right." })

keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Move to start of line." })
keymap.set({ "n", "v", "o" }, "T", "<C-d>", { desc = "Move down half a page." })
keymap.set({ "n", "v", "o" }, "N", "<C-u>", { desc = "Move up half a page." })
keymap.set({ "n", "v", "o" }, "S", "$", { desc = "Move to end of line." })

-- Swap ; and :
keymap.set({ "n", "v" }, ";", ":", { desc = "Swap ; and :" })
keymap.set({ "n", "v" }, ":", ";", { desc = "Swap ; and :" })

-- Pane navigation
keymap.set({ "n", "v", "i" }, "<M-h>", "<cmd>TmuxNavigateLeft<cr><esc>", { desc = "Navigate left a pane." })
keymap.set({ "n", "v", "i" }, "<M-t>", "<cmd>TmuxNavigateDown<cr><esc>", { desc = "Navigate down a pane." })
keymap.set({ "n", "v", "i" }, "<M-n>", "<cmd>TmuxNavigateUp<cr><esc>", { desc = "Navigate up a pane." })
keymap.set({ "n", "v", "i" }, "<M-s>", "<cmd>TmuxNavigateRight<cr><esc>", { desc = "Navigate right a pane." })
keymap.set({ "n", "v", "i" }, "<M-->", "<cmd>TmuxNavigatePrevious<cr><esc>", { desc = "Navigate to previous pane." })

-- Back and forward in jump list
keymap.set({ "n", "v" }, "-", "<C-o>", { desc = "Back in the jump list" })
keymap.set({ "n", "v" }, "_", "<C-i>", { desc = "Forward in the jump list" })

-- Keys displaced by dvorak movement keys.
keymap.set({ "n", "v", "o" }, "j", "n", { desc = "Next search hit." })
keymap.set({ "n", "v", "o" }, "k", "N", { desc = "Previous search hit." })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Toggle diagnostics
keymap.set(
	"n",
	"<leader>td",
	(function()
		local diag_status = 1 -- 1 is show; 0 is hide
		return function()
			if diag_status == 1 then
				diag_status = 0
				vim.diagnostic.hide()
			else
				diag_status = 1
				vim.diagnostic.show()
			end
		end
	end)()
)
