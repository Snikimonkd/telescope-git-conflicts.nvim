local pickers = require("telescope.pickers")
local make_entry = require("telescope.make_entry")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local utils = require("telescope.utils")

local git_command = utils.__git_command

local M = {}

M.conflicts = function(opts)
	opts.git_command =
		vim.F.if_nil(opts.git_command, git_command({ "diff", "--name-only", "--diff-filter=U", "--relative" }, opts))
	opts.entry_maker = vim.F.if_nil(opts.entry_maker, make_entry.gen_from_file(opts))

	pickers
		.new(opts, {
			prompt_title = "Git Conflicts",
			__locations_input = true,
			finder = finders.new_oneshot_job(
				vim.tbl_flatten({
					opts.git_command,
				}),
				opts
			),
			previewer = conf.grep_previewer(opts),
			sorter = conf.file_sorter(opts),
		})
		:find()
end

return M
