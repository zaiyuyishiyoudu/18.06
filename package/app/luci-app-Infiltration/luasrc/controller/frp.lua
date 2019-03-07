module("luci.controller.frp", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/frp") then
		return
	end

	entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
	entry({"admin", "vpn", "infiltration"},
	alias("admin", "vpn", "infiltration", "frpc"),
	_("Infiltration"), 10)

	entry({"admin","vpn","infiltration", "frpc"},cbi("frp/frp"), _("Frp Setting"),5).dependent=true
	entry({"admin","vpn","infiltration", "n2n_v2"},cbi("n2n_v2"), _("N2N v2 VPN"),10).dependent=true
	entry({"admin","vpn","infiltration", "ssrs"},cbi("ssrs"), _("SSR Python Server"),20).dependent=true
	entry({"admin","vpn","infiltration", "zerotier"},cbi("zerotier"), _("ZeroTier"),30).dependent=true
	entry({"admin","vpn","infiltration","config"},cbi("frp/config")).leaf=true
	entry({"admin","vpn","infiltration","frpc","status"},call("status")).leaf=true
	entry({"admin","vpn","infiltration","ssrs","status"},call("act_status")).leaf=true
	entry({"admin","vpn","infiltration","zerotier","status"},call("ze_status")).leaf=true
end
function status()
local e={}
e.running=luci.sys.call("pidof frpc > /dev/null")==0
luci.http.prepare_content("application/json")
luci.http.write_json(e)
end

function act_status()
  local e={}
  e.running=luci.sys.call("ps | grep server.py |grep -v grep >/dev/null") == 0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end

function ze_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/zerotier-one >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
