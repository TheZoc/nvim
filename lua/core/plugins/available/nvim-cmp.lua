return
{
    -- hrsh7th/nvim-cmp is fragmented into multiple plugins.
    -- Adding them here to make it easier to manage
    {
        -- Plugin
        'hrsh7th/nvim-cmp',

        -- Dependencies
        dependencies = {
            'neovim/nvim-lspconfig',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
        },

        -- Opts
        opts = {
            ensure_installed = {
                "clangd",
                "pylsp",
            },
        },

        -- Configuration
        config = function(self, opts)

            -- luasnip setup
            local luasnip = require('luasnip')

            -- nvim-cmp setup
            local cmp = require 'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Down
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                }),
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},
                },
                {name = 'buffer'},
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({'/', '?'}, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    {name = 'buffer'},
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    {name = 'path'},
                },
                {
                    {name = 'cmdline'},
                }),
                matching = {disallow_symbol_nonprefix_matching = false},
            })

        end
    },
    {
        -- Plugin
        'hrsh7th/cmp-buffer',

        -- Configuration
        config = function()
            require('cmp').setup({
                sources = {
                    {name = 'buffer'},
                    option = {
                        -- Options go into this table
                    },
                },
            })
        end
    },
    {
        -- Plugin
        'hrsh7th/cmp-nvim-lsp',

        -- Dependencies
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
    {
        -- Plugin
        'L3MON4D3/LuaSnip',
    },
    {
        -- Plugin
        'saadparwaiz1/cmp_luasnip',

        -- Dependencies
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
}
