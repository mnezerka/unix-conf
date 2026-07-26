local my_commands = {
    { name = "Format json", cmd = "%!python3 -m json.tool" },
    { name = "Space Mappings", cmd = "map <space>" },
    { name = "Telescope Mappings", cmd = "Telescope keymaps" },
}

local show_my_commands = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers.new(require("telescope.themes").get_dropdown({
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            anchor = "N",
            mirror = true,
        },
    }), {
        prompt_title = "My Commands",
        finder = finders.new_table({
            results = my_commands,
            entry_maker = function(entry)
                return { value = entry.cmd, display = entry.name, ordinal = entry.name }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd(selection.value)
            end)
            return true
        end,
    }):find()
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    theme = "center",
    keys = {
        { '<Leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
        { '<Leader>fg', function() require('telescope.builtin').live_grep() end, desc = "Live Grep" },
        { '<Leader>fb', function() require('telescope.builtin').buffers() end, desc = "List Buffers" },
        { '<Leader>fh', function() require('telescope.builtin').help_tags() end, desc = "Help Tags" },
        { '<Leader>fc', function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Fuzzy Find in Current Buffer"},

        { '<Leader>mc', show_my_commands, desc = "My Commands" },
        { '<Leader>ch', function() require('telescope.builtin').command_history() end, desc = "Command History"},

        { '<Leader>ss', function() require('telescope.builtin').spell_suggest() end, desc = "Spell Suggest"},

        {  '<Leader>gd', function() require('telescope.builtin').lsp_definitions() end,  desc = "Telescope Definitions" },
        {  '<Leader>gr', function() require('telescope.builtin').lsp_references() end, desc = "Telescope References" },
        {  '<Leader>gi', function() require('telescope.builtin').lsp_implementations() end, desc = "Telescope Implementations" },

        { '<Leader>gs', function() require('telescope.builtin').git_status() end, desc = "Git Status"},
        { '<Leader>gc', function() require('telescope.builtin').git_commits() end, desc = "Git Commits"},
    },

    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = require("telescope.themes").get_dropdown({
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                    anchor = "N",
                    mirror = true,
                },
            }),
        })
    end,
}
