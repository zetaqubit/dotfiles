return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<m-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<m-t>", "<cmd>TmuxNavigateDown<cr>" },
    { "<m-n>", "<cmd>TmuxNavigateUp<cr>" },
    { "<m-s>", "<cmd>TmuxNavigateRight<cr>" },
    { "<m-->", "<cmd>TmuxNavigatePrevious<cr>" },
  },
  config = function()
    vim.g.tmux_navigator_no_wrap = 1
  end,
    
}
