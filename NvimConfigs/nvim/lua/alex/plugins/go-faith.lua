-- In your lazy.nvim configuration file (e.g., lua/plugins/go.lua or similar)
return {
	{
		"fatih/vim-go",
		ft = "go", -- Load only for Go filetypes
		-- Alternatively, use lazy = true and specify events/commands/keymaps for loading
		-- lazy = true,
		-- event = { 'BufReadPre *.go', 'BufNewFile *.go' },
		-- cmd = { 'GoBuild', 'GoTest' }, -- Example commands that would trigger loading
		-- keys = { { '<leader>gb', function() vim.cmd('GoBuild') end, mode = 'n' } }, -- Example keymap
		keys = {
			{ "<leader>gie", "<cmd>GoIfErr<CR>", desc = "Insert if err != nil", mode = "n" },
			{ "<leader>gajt", "<cmd>GoAddTags json<CR>", desc = "Add JSON tags to struct", mode = "n" },
			{ "<leader>gat", "<cmd>GoAlternate<CR>", desc = "Switch between _test.go and .go files", mode = "n" },
		},
	},
}
