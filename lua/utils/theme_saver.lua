local M = {}

local theme_file_path = vim.fn.stdpath("config") .. "/last_theme.txt"

function M.save_current_theme()
    local current_colorscheme = vim.g.colors_name
    if current_colorscheme ~= "" then
        local file = io.open(theme_file_path, "w")
        if file then
            file:write(current_colorscheme)
            io.close(file)
        else
            vim.notify("Could not save theme to " .. theme_file_path, vim.log.levels.ERROR)
        end
    end
end

function M.apply_saved_theme()
    local file = io.open(theme_file_path, "r")
    if file then
        local saved_theme = file:read("*l")
        io.close(file)
        if saved_theme and saved_theme ~= "" then
            -- Check if the theme is actually available before trying to load it
            -- This is a simplistic check, a more robust solution might involve lazy.nvim's API
            local status, _ = pcall(vim.cmd, "colorscheme " .. saved_theme)
            if status then
                vim.notify("Applied saved theme: " .. saved_theme, vim.log.levels.INFO)
            else
                vim.notify("Failed to apply saved theme: " .. saved_theme .. ". Theme might not be installed or available.", vim.log.levels.WARN)
            end
        end
    end
end

return M