local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end
local function opts(mode, prefix)
	return {
		mode = mode,
		prefix = prefix,
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
end
-- Normal Mode <leader> Mappings
local Nmappings = {
	n = {
		name = "Notes",
		b = {
			function()
				require("zk.commands")("ZkBacklinks")()
			end,
			"Backlink Picker",
		},
		d = {
			function()
				require("zk.commands")("ZkCd")()
			end,
			"Change Directory",
		},
		r = {
			function()
				require("zk.commands")("ZkIndex")()
			end,
			"Refresh Index",
		},
		l = {
			function()
				require("zk.commands")("ZkLinks")()
			end,
			"Link Picker",
		},
		s = {
			function()
				require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
			end,
			"Search",
		},
		j = {
			function()
				require("zk.commands").get("ZkNew")({ dir = "journal", noInput = true })
			end,
			"New Journal Entry",
		},
		n = {
			function()
				require("zk.commands").get("ZkNew")({ dir = "personal", title = vim.fn.input("Title: ") })
			end,
			"New Personal Note",
		},
		N = {
			function()
				require("zk.commands").get("ZkNew")({ dir = "work", title = vim.fn.input("Title: ") })
			end,
			"New Work Note",
		},
		t = {
			function()
				require("zk.commands").get("ZkTags")()
			end,
			"Tags",
		},
		i = { "<Plug>(simple-todo-new-list-item)", "Insert Todo" },
		I = { "<Plug>(simple-todo-new-list-item-start-of-line)", "Convert to Todo" },
		o = { "<Plug>(simple-todo-below)", "Insert Todo Below" },
		O = { "<Plug>(simple-todo-above)", "Insert Todo Above" },
		x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
		X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
		["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
	},
	x = {
		name = "Debugger",
		b = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle Breakpoint",
		},
		B = {
			function()
				require("dap").clear_breakpoints()
			end,
			"Clear Breakpoints",
		},
		c = {
			function()
				require("dap").continue()
			end,
			"Continue",
		},
		i = {
			function()
				require("dap").step_into()
			end,
			"Step Into",
		},
		l = {
			function()
				require("dapui").float_element("breakpoints")
			end,
			"List Breakpoints",
		},
		o = {
			function()
				require("dap").step_over()
			end,
			"Step Over",
		},
		q = {
			function()
				require("dap").close()
			end,
			"Close Session",
		},
		Q = {
			function()
				require("dap").terminate()
			end,
			"Terminate",
		},
		r = {
			function()
				require("dap").repl.toggle()
			end,
			"REPL",
		},
		s = {
			function()
				require("dapui").float_element("scopes")
			end,
			"Scopes",
		},
		t = {
			function()
				require("dapui").float_element("stacks")
			end,
			"Threads",
		},
		u = {
			function()
				require("dapui").toggle()
			end,
			"Toggle Debugger UI",
		},
		w = {
			function()
				require("dapui").float_element("watches")
			end,
			"Watches",
		},
		x = {
			function()
				require("dap.ui.widgets").hover()
			end,
			"Inspect",
		},
	},
}
local Vmappings = {
	n = {
		name = "Notes",
		s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
		n = {
			":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
			"New Personal Note From Title",
		},
		N = {
			":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'work' })<cr>",
			"New Work Note From Title",
		},
		W = {
			":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
			"New Work Note From Content",
		},
		C = {
			":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
			"New Personal Note From Content",
		},
		x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
		X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
		["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
	},
	x = {
		name = "Debugger",
		e = {
			function()
				require("dapui").eval()
			end,
			"Evaluate Line",
		},
	},
}
which_key.register(Vmappings, opts("v", "<leader>"))
return Nmappings