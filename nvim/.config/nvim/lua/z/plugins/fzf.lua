return {
  'ibhagwan/fzf-lua',
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
          layout = "vertical"
        }
      },
    })
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", require('fzf-lua').oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", require('fzf-lua').live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", require('fzf-lua').grep_cword, { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fg", require('fzf-lua').resume, { desc = "Resume last find" })
    -- keymap.set("n", "<leader>ft", require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true}), { desc = "Find todos" })
  end,
}
