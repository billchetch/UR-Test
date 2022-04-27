include("../common/lua/utils.lua");

local utils = Utils();
local socket = require("socket").new();

-- Events

events.create = function()
	
end

local host = "127.0.0.1";
local port = 8200;

events.focus = function()

	utils.assignCommands(actions, "Connect,Send,Close", function(cmd)
			if cmd == "Send" then
				print("Send data");
				socket:write("Some data dude");
			end 
			if cmd == "Connect" then
				print("Connecting to: " .. host .. ":" .. port);
				socket:connect(host, port);
			end
			if cmd == "Close" then
				print("Closing");
				socket:close();
			end
		end
	);

	socket:onerror(function(err)
			print("Error: " .. err);
		end
	);

	socket:onconnect(function()
			print("Connected");
		end
	);

	socket:ondata(function(data)
			print("Holy feck");
		end
	);

	socket:onclose(function()
			print("Closed");
		end
	);

end

events.blur = function()
	print("Blur called")
end

-- Actions