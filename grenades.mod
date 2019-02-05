return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`grenades` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("grenades", {
			mod_script       = "scripts/mods/grenades/grenades",
			mod_data         = "scripts/mods/grenades/grenades_data",
			mod_localization = "scripts/mods/grenades/grenades_localization",
		})
	end,
	packages = {
		"resource_packages/grenades/grenades",
	},
}
