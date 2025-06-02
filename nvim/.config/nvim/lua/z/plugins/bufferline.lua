return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
        -- This hides the bufferline when there's only one buffer
      always_show_bufferline = false,
    },
  },
}
