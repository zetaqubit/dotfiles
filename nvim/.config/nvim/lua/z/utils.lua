local M = {}

function M.git_root_of_file_or_cwd()
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
  return dir
end

function M.with_git_root(fn)
  return function(opts)
    local git_root = M.git_root_of_file_or_cwd()
    if git_root then
      opts = vim.tbl_deep_extend("force", opts or {}, { cwd = git_root })
      fn(opts)
    else
      vim.notify("Not inside a git repository", vim.log.levels.WARN)
    end
  end
end

local excluded_filetypes = {
  "DiffviewFiles",
  "DiffviewFileHistory",
  "DiffviewFileHistoryPanel",
  "DiffviewPanel",
  "git",
  "blame",
}

local function is_excluded_ft(ft)
  for _, eft in ipairs(excluded_filetypes) do
    if ft == eft then return true end
  end
  return false
end

function M.get_last_vcs_file_git_root()
  -- MRU buffers in Neovim
  local bufs = vim.fn.getbufinfo({buflisted=1})
  table.sort(bufs, function(a, b)
    return a.lastused > b.lastused
  end)
  for _, buf in ipairs(bufs) do
    local name = buf.name
    if name ~= '' and vim.fn.filereadable(name) == 1 and not is_excluded_ft(buf.filetype) then
      local file_dir = vim.fn.fnamemodify(name, ":h")
      local git_root = vim.fn.systemlist(
        'git -C "' .. file_dir .. '" rev-parse --show-toplevel'
      )[1]
      if git_root and git_root ~= '' then
        return git_root
      end
    end
  end
  return nil
end

return M
