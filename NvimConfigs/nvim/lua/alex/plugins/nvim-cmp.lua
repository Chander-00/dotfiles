-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
-- 		"hrsh7th/cmp-path", -- source for file system paths
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			-- follow latest release.
-- 			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 			-- install jsregexp (optional!).
-- 			build = "make install_jsregexp",
-- 		},
-- 		"saadparwaiz1/cmp_luasnip", -- for autocompletion
-- 		"rafamadriz/friendly-snippets", -- useful snippets
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
--
-- 		local luasnip = require("luasnip")
--
-- 		local lspkind = require("lspkind")
--
-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		cmp.setup({
-- 			completion = {
-- 				completeopt = "menu,menuone,preview,noselect",
-- 			},
-- 			snippet = { -- configure how nvim-cmp interacts with snippet engine
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 			}),
-- 			-- sources for autocompletion
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- snippets
-- 				{ name = "buffer" }, -- text within current buffer
-- 				{ name = "path" }, -- file system paths
-- 			}),
--
-- 			-- configure lspkind for vs-code like pictograms in completion menu
-- 			formatting = {
-- 				format = lspkind.cmp_format({
-- 					maxwidth = 50,
-- 					ellipsis_char = "...",
-- 				}),
-- 			},
-- 		})
--
-- 		cmp.setup.filetype("copilot-chat", {
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" },
-- 				{ name = "buffer" },
-- 				-- { name = "path" }, -- path source is omitted for copilot-chat
-- 			}),
-- 		})
-- 	end,
-- }

-- Second config
-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
-- 		"hrsh7th/cmp-path", -- source for file system paths
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			-- follow latest release.
-- 			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 			-- install jsregexp (optional!).
-- 			build = "make install_jsregexp",
-- 		},
-- 		"saadparwaiz1/cmp_luasnip", -- for autocompletion
-- 		"rafamadriz/friendly-snippets", -- useful snippets
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
--
-- 		local luasnip = require("luasnip")
--
-- 		local lspkind = require("lspkind")
--
-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		cmp.setup({
-- 			snippet = { -- configure how nvim-cmp interacts with snippet engine
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 			}),
-- 			-- sources for autocompletion
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- snippets
-- 				{ name = "buffer" }, -- text within current buffer
-- 				{ name = "path" }, -- file system paths
-- 				{ name = "copilot" }, -- github copilot cmp
-- 			}),
--
-- 			-- configure lspkind for vs-code like pictograms in completion menu
-- 			formatting = {
-- 				format = lspkind.cmp_format({
-- 					maxwidth = 50,
-- 					ellipsis_char = "...",
-- 				}),
-- 			},
-- 		})
-- 	end,
-- }
--
-- Third config
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons", -- <- add Web Devicons
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local devicons = require("nvim-web-devicons") -- load web devicons

		require("luasnip.loaders.from_vscode").lazy_load()

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				format = function(entry, vim_item)
					-- Start with lspkind icons
					vim_item = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, vim_item)

					-- Web Devicons for files/paths
					if entry.source.name == "path" or entry.source.name == "buffer" then
						local icon, hl = devicons.get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon .. " " .. vim_item.kind
						end
					end

					-- Custom source icons
					-- local source_icons = {
					-- 	copilot = "",
					-- 	nvim_lsp = "",
					-- 	luasnip = "",
					-- 	buffer = "﬘",
					-- 	path = "",
					-- }
					-- Replace your old table with this one:
					-- Replace your old table with this exact block:
					local source_icons = {
						copilot = "\u{eb8c}",
						nvim_lsp = "\u{f048b}",
						luasnip = "\u{f0a6b}",
						buffer = "\u{f0219}",
						path = "\u{f0770}",
					}

					local src_icon = source_icons[entry.source.name]
					if src_icon then
						vim_item.kind = src_icon .. " " .. vim_item.kind
					end

					-- Highlight Copilot
					if entry.source.name == "copilot" then
						vim_item.kind_hl_group = "CmpItemKindCopilot"
					end

					return vim_item
				end,
			},
		})
	end,
}
