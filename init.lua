-- startup settings
local cache_path = vim.fn.stdpath("cache") .. "/_defaults_cache.lua"
local defaults_path = vim.fn.stdpath("config") .. "/lua/vim/_defaults.lua"

if vim.fn.filereadable(cache_path) == 0 then
	local f = io.open(cache_path, "w")
	f:write(string.dump(loadfile(defaults_path)))
	f:close()
end

dofile(cache_path)

-- keymaps
require("keymaps")

-- lazyvim
require("lazyvim")

-- utils settings
require("options")
require("lang_conf")
