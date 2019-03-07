module("luci.controller.download", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/aria2") then
		return
	end

	entry({"admin", "nas", "download"},
	alias("admin", "nas", "download", "aria2"),
	_("Download tool"), 10)

	entry({"admin","nas","download", "aria2"},cbi("aria2"), _("Aria2 Settings"),5).dependent=true
	entry({"admin","nas","download", "transmission"},cbi("transmission"), _("Transmission"),10).dependent=true
	entry({"admin","nas","download","aria2","status"},call("status")).leaf=true
	entry({"admin","nas","download","transmission","status"},call("act_status")).leaf=true

end

function status()
	local sys  = require "luci.sys"
	local ipkg = require "luci.model.ipkg"
	local http = require "luci.http"
	local uci  = require "luci.model.uci".cursor()

	local status = {
		running = (sys.call("pidof aria2c > /dev/null") == 0),
		yaaw = ipkg.installed("yaaw"),
		webui = ipkg.installed("webui-aria2")
	}

	http.prepare_content("application/json")
	http.write_json(status)
end

function act_status()
  local e={}
  e.running=luci.sys.call("pgrep transmission > /dev/null") == 0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
