return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    require("blame").setup({})
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Toggle Blame" })
  end,
  opts = {
    date_format = "%d.%m.%Y",
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
    format_fn = ("blame.formats.default_formats").commit_date_author_fn,
    mappings = {
      commit_info = "i",
      stack_push = "<TAB>",
      stack_pop = "<BS>",
      show_commit = "<CR>",
      close = { "<esc>", "q" },
    },
  },
}
