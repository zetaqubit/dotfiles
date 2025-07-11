return {
	"ibhagwan/fzf-lua",
	opts = {
		oldfiles = {
			-- In Telescope, when I used <leader>fr, it would load old buffers.
			-- fzf lua does the same, but by default buffers visited in the current
			-- session are not included. I use <leader>fr all the time to switch
			-- back to buffers I was just in. If you missed this from Telescope,
			-- give it a try.
			include_current_session = true,
		},
	},

	config = function()
		require("fzf-lua").setup({
			"hide",
			grep = {
				rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git/*'",
			},
			winopts = {
				preview = {
					layout = "vertical",
				},
			},
		})
		local function last_commit_files(opts)
			require("fzf-lua").fzf_exec(
				"git diff-tree --no-commit-id --name-only -r HEAD",
				vim.tbl_deep_extend("force", opts or {}, { prompt = "Last Commit Files> " })
			)
		end

		local utils = require("z.utils")

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "[F]ind [f]iles in cwd" })
		-- keymap.set("n", "<leader>fr", require('fzf-lua').oldfiles, { desc = "[F]ind [r]ecent files" })
		keymap.set("n", "<leader>fs", require("fzf-lua").live_grep, { desc = "[F]ind [s]tring in cwd" })
		keymap.set("n", "<leader>f*", require("fzf-lua").grep_cword, { desc = "[F]ind string under [c]ursor in cwd" })
		keymap.set("n", "<leader>f:", "<cmd>FzfLua command_history<CR>", { desc = "Search command history" })
		keymap.set("n", "<leader>f;", "<cmd>FzfLua command_history<CR>", { desc = "Search command history" })
		keymap.set("n", "<leader>f/", "<cmd>FzfLua search_history<CR>", { desc = "Search search history" })
		keymap.set("n", "<leader>fg", require("fzf-lua").resume, { desc = "[R]esume last find" })
		keymap.set(
			"n",
			"<leader>fp",
			utils.with_git_root(require("fzf-lua").git_status),
			{ desc = "[F]ind Git [p]ending files" }
		)
		keymap.set("n", "<leader>fl", utils.with_git_root(last_commit_files), { desc = "[F]ind [L]ast commit files." })
		keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "[F]ind [k]eymaps" })
		keymap.set("n", "<leader>ft", "<cmd>TodoFzfLua<CR>", { desc = "Find todos" })
	end,
}
