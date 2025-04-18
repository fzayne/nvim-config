return {
    'ccaglak/phptools.nvim',
    -- keys = {
    --     { "<leader>lm", "<cmd>PhpTools Method<cr>" },
    --     { "<leader>lc", "<cmd>PhpTools Class<cr>" },
    --     { "<leader>ls", "<cmd>PhpTools Scripts<cr>" },
    --     { "<leader>ln", "<cmd>PhpTools Namespace<cr>" },
    --     { "<leader>lg", "<cmd>PhpTools GetSet<cr>" },
    --     { "<leader>lf", "<cmd>PhpTools Create<cr>" },
    --     { "<leader>ld", "<cmd>PhpTools DrupalAutoLoader<cr>" },
    --     { mode = "v",   "<leader>lr",                        "<cmd>PhpTools Refactor<cr>" },
    -- },
    dependencies = {
        -- "ccaglak/namespace.nvim", -- optional - php namespace resolver
        -- "ccaglak/larago.nvim", -- optional -- laravel goto blade/components
        -- "ccaglak/snippets.nvim", -- optional -- native snippet expander
    },
    config = function()
        require('phptools').setup({
            ui = {
                enable = true,                                       -- default:true; false only if you have a UI enhancement plugin
                fzf = false                                          -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
            },
            drupal_autoloader = {                                    -- delete if you dont use it
                enable = false,                                      -- default:false
                scan_paths = { "/web/modules/contrib/" },            -- Paths to scan for modules
                root_markers = { ".git" },                           -- Project root markers
                autoload_file = "/vendor/composer/autoload_psr4.php" -- Autoload file path
            },
            custom_toggles = {                                       -- delete if you dont use it
                enable = true,                                       -- default:false
                -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
            }
        })

        local map = vim.keymap.set
        map('n', '<leader>pm', '<cmd>PhpTools Method<cr>', { desc = "Generate undefined method" })
        map('n', '<leader>pc', '<cmd>PhpTools Class<cr>', { desc = "Creates undefined classes" })
        map('n', '<leader>ps', '<cmd>PhpTools Scripts<cr>', { desc = "Runs Composer scripts" })
        map('n', '<leader>pn', '<cmd>PhpTools Namespace<cr>',
            { desc = "Generates the appropriate namespace for the current file" })
        map('n', '<leader>pg', '<cmd>PhpTools GetSet<cr>', { desc = "generates getter, setter, or both" })
        map('n', '<leader>pf', '<cmd>PhpTools Create<cr>', { desc = "create a new PHP entity" })
        map('n', '<leader>pd', '<cmd>PhpTools DrupalAutoLoader<cr>',
            { desc = "automatically manages PSR-4 autoloading for Drupal modules" })
        map('v', '<leader>pr', '<cmd>PhpTools PhpTools Refactor<cr>',
            { desc = "urround your PHP code with common structure" })

        local ide_helper = require('phptools.ide_helper') -- delete if you dont use it
        -- Laravel IDE Helper keymaps
        map('n', '<leader>lha', ide_helper.generate_all, { desc = 'Generate all IDE helpers' })
        map('n', '<leader>lhm', ide_helper.generate_models, { desc = 'Generate model helpers' })
        map('n', '<leader>lhf', ide_helper.generate_facades, { desc = 'Generate facade helpers' })
        map('n', '<leader>lht', ide_helper.generate_meta, { desc = 'Generate meta helper' })
        map('n', '<leader>lhi', ide_helper.install, { desc = 'Install IDE Helper package' })


        local tests = require("phptools.tests") -- delete if you have a test plugin
        map("n", "<Leader>ta", tests.test.all, { desc = "Run all tests" })
        map("n", "<Leader>tf", tests.test.file, { desc = "Run current file tests" })
        map("n", "<Leader>tl", tests.test.line, { desc = "Run test at cursor" })
        map("n", "<Leader>ts", tests.test.filter, { desc = "Search and run test" })
        map("n", "<Leader>tp", tests.test.parallel, { desc = "Run tests in parallel" })
        map("n", "<Leader>tr", tests.test.rerun, { desc = "Rerun last test" })
        map("n", "<Leader>ti", tests.test.selected, { desc = "Run selected test file" })
    end
}
