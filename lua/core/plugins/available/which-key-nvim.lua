return
{
    -- Plugin
    "folke/which-key.nvim",

    -- Delay loading this plugin
    event = "VeryLazy",

    -- Opts
    opts = {
        plugins = {
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
        },
    },

    -- Init
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    -- Configuration
    config = function(self, opts)
        local group_mappings = {
            ["<leader>f"] = {name = "file"},
        }
        require('which-key').register(group_mappings)
    end

}
