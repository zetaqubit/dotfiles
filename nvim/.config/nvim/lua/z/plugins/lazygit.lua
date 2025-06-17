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
      local function find_git_root(filepath)
        local path = vim.fn.fnamemodify(filepath, ":p:h")
        local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(path) .. " rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 then
          return git_root
        end
        return nil
      end

      local file = vim.api.nvim_buf_get_name(0)
      local dir = find_git_root(file) or vim.loop.cwd()

      require("lazygit.utils").project_root_dir = function()
        return dir
      end

      vim.cmd("LazyGitCurrentFile") -- or just "LazyGit"
    end, {})
  end,
}
