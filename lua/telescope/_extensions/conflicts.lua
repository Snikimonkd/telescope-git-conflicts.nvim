local conflicts = require("conflicts")

return require("telescope").register_extension({
	exports = {
		conflicts = conflicts.conflicts,
	},
})
