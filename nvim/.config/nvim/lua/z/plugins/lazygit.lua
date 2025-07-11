return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
  config = function()
    -- Override LazyGit to use the current file's git root
    vim.api.nvim_create_user_command("LazyGit", function()
      local dir = require('z.utils').git_root_of_file_or_cwd()
      require("lazygit.utils").project_root_dir = function()
        return dir
      end
      vim.cmd("LazyGitCurrentFile") -- or just "LazyGit"
    end, {})
  end,
}
