return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  opts = {
    date_format = "%Y-%m-%d",
    virtual_style = "right_align",
    views = {
      window = window_view,
      virtual = virtual_view,
      default = window_view,
    },
    focus_blame = true,
    merge_consecutive = false,
    max_summary_width = 30,
    colors = nil,
    blame_options = nil,
    commit_detail_view = "vsplit",
    format_fn = ("blame.formats.default_formats").date_message,
    mappings = {
      commit_info = "i",
      stack_push = "<TAB>",
      stack_pop = "<BS>",
      show_commit = "<CR>",
      close = { "<esc>", "q" },
    },
  },
  config = function(_, opts)
    require("blame").setup(opts)
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Toggle Blame" })
    keymap.set("n", "<leader>gB", "<cmd>BlameToggle virtual<CR>", { desc = "Toggle Blame (virtual text)" })
  end,
}
