return {
        "goolord/alpha-nvim",
        dependencies = { "nvim-mini/mini.icons" },
        config = function()
                local alpha = require("alpha")
                local dashboard = require("alpha.themes.dashboard")
    
                local function command_exists(cmd)
                        local handle = io.popen("which " .. cmd .. " 2>/dev/null")
                        if handle then
                                local result = handle:read("*a")
                                handle:close()
                                return result ~= ""
                        end
                        return false
                end
    
                local function get_fortune()
                        if command_exists("fortune") and command_exists("cowsay") then
                                local handle = io.popen("fortune -s | cowsay")
                                if handle then
                                        local result = handle:read("*a")
                                        handle:close()
                                        return result
                                end
                        end
    
                        return [[
    ╭───────────────────────────────────────────╮
    │  You feel a whole lot more like you do    │
    │    now than you did when you used to.     │
    ╰───────────────────────────────────────────╯
                        ]]
                end
    
                dashboard.section.header.val = vim.split(get_fortune(), "\n")
                dashboard.section.header.opts.hl = "AlphaHeader"
    
                dashboard.section.buttons.val = {
                        dashboard.button("n", "󰈔  New File", ":ene <BAR> startinsert<CR>"),
                        dashboard.button("SPC f f", "󰈞  Fuzzy Find", ":Telescope find_files<CR>"),
                        dashboard.button("SPC f r", "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
                        dashboard.button("SPC f g", "󰊄  Fuzzy Grep", ":Telescope git_files<CR>"),
                        dashboard.button("q", "󰈆  Quit", "<cmd>q!<cr>"),
                }
    
                local function get_day_of_week()
                        return os.date("%A")
                end
    
                dashboard.section.footer.val = {
                        get_day_of_week(),
                }
                dashboard.section.footer.opts.hl = "AlphaFooter"
    
                -- Vertically center the dashboard: top padding = half the leftover
                -- space between the window height and the rendered content.
                local function top_padding()
                        local content = #dashboard.section.header.val   -- header lines
                                + #dashboard.section.buttons.val        -- one line per button
                                + #dashboard.section.footer.val         -- footer lines
                                + 2 + 1                                 -- inner paddings below
                        return math.max(1, math.floor((vim.o.lines - content) / 2) - 1)
                end
    
                dashboard.config.layout = {
                        { type = "padding", val = top_padding() },
                        dashboard.section.header,
                        { type = "padding", val = 2 },
                        dashboard.section.buttons,
                        { type = "padding", val = 1 },
                        dashboard.section.footer,
                }
    
                alpha.setup(dashboard.config)
                vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    
                -- Keep it centered when the window is resized while open.
                vim.api.nvim_create_autocmd("VimResized", {
                        callback = function()
                                if vim.bo.filetype == "alpha" then
                                        dashboard.config.layout[1].val = top_padding()
                                        pcall(require("alpha").redraw)
                                end
                        end,
                })
        end,
    }