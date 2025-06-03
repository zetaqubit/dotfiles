return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending", -- display results top->bottom
          layout_config = {
            prompt_position = "top"       -- search bar at the top
          },
          path_display = { "smart" },
          pickers = {
            live_grep = {
              file_ignore_patterns = { 'node_modules', '.git', '.venv' },
              additional_args = function(_)
                return { "--hidden" }
              end
            },
            find_files = {
              file_ignore_patterns = { 'node_modules', '.git', '.venv' },
              hidden = true
            },
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,                   -- exit telescope on first ESC (normally enters normal mode)
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          smart_open = {
            match_algorithm = "fzf",
            disable_devicons = false,
          },
        },
      })

      telescope.load_extension("fzf")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      -- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
      vim.keymap.set("n", "<leader><leader>", function()
        require("telescope").extensions.smart_open.smart_open()
      end, { noremap = true, silent = true, desc = 'Smart open file based on use' })
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
}
