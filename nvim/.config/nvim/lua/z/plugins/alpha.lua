return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- 🔧 Inline helper to make keystroke buttons easy
    local function keystroke_button(sc, txt, keys, total_width)
      total_width = total_width or 60 -- you can tune this

      local shortcut = sc
      local text_width = vim.fn.strdisplaywidth(txt)
      local shortcut_width = vim.fn.strdisplaywidth(shortcut)
      local padding = total_width - text_width - shortcut_width

      if padding < 1 then padding = 1 end

      local label = txt .. string.rep(" ", padding) .. shortcut

      return {
        type = "button",
        val = label,
        on_press = function()
          local key = vim.api.nvim_replace_termcodes(keys, true, false, true)
          vim.api.nvim_feedkeys(key, "t", false)
        end,
        opts = {
          position = "center",
          hl = "AlphaButton",
          hl_shortcut = "Keyword",
          shortcut = "",  -- we already drew it
        },
      }
    end

    -- Set menu
    dashboard.section.buttons.val = {
      keystroke_button("e", " > New File", "<cmd>ene<CR>"),
      keystroke_button("SPC ee", " > Toggle file explorer", "<leader>ee"),
      keystroke_button("SPC ff", "󰱼 > Find File", "<leader>ff"),
      keystroke_button("SPC fs", " > Find String", "<leader>fs"),
      keystroke_button("SPC fr", "󰱼 > Recent Files", "<leader>fr"),
      keystroke_button("SPC wr", "󰁯 > Restore Session For Current Directory", "<leader>wr"),
      keystroke_button("SPC lg", "⎇ > Lazygit", "<leader>lg"),
      keystroke_button("SPC fp", "⎇ > Git pending files", "<leader>fp"),
      keystroke_button("ZZ", " > Quit NVIM", "ZZ"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

