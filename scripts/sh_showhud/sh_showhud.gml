function sh_showhud(args)
{
	if array_length(args) > 1
	{
		if args[1] == "true" or args[1] == "1"
			global.showhud = true;
		if args[1] == "false" or args[1] == "0"
			global.showhud = true;
	}
	else
		global.showhud = !global.showhud;
}
function meta_showhud()
{
	return {
		description: "Shows the HUD",
		arguments: ["<bool>"],
		suggestions: [
			["true", "false"]
		],
	}
}
