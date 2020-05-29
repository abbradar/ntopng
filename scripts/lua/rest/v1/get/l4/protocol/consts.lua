--
-- (C) 2013-20 - ntop.org
--

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path

require "lua_utils"
local json = require "dkjson"
local rest_utils = require "rest_utils"

--
-- Read all the  L4 protocols
-- Example: curl -u admin:admin http://localhost:3000/lua/rest/v1/get/l4/protocol/consts.lua
--
-- NOTE: in case of invalid login, no error is returned but redirected to login
--

sendHTTPHeader('application/json')

local rc = rest_utils.consts_ok
local res = {}

for _, l4_key in pairs(l4_keys) do
   -- l4_keys example structure
   -- table
   -- 1 table
   -- 1.1 string IP
   -- 1.2 string ip
   -- 1.3 number 0
   -- 2 table
   -- 2.1 string ICMP
   -- 2.2 string icmp
   -- 2.3 number 1
   res[#res + 1] = {
     name = l4_key[1], 
     id = l4_key[3],
   }
end

print(rest_utils.rc(rc, res))

