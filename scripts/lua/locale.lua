--
-- (C) 2013-22 - ntop.org
--

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path
package.path = dirs.installdir .. "/scripts/locales/?.lua;" .. package.path

require "lua_utils"
local json = require "dkjson"

-- ################################

local info = ntop.getInfo(false)
local lines = {
   'Cache-Control: public, max-age=3600',
   'Last-Modified: '..os.date("!%a, %m %B %Y %X %Z"),
   'Server: ntopng '..info["version"]..' ['.. info["platform"]..']',
   'Content-Type: text/javascript'
}

print("HTTP/1.1 200 OK\r\n" .. table.concat(lines, "\r\n") .. "\r\n\r\n")

-- ################################

local language = _GET["user_language"] or "en"

local path = require(language)

print[[
const ntop_locale = ]] print(json.encode(path)) print[[;

function i18n(key) { 
    var fields = key.split('.');
    var val = null;
      
    for(var i = 0; i < fields.length; i++) {
        if(i == 0) {
            val = ntop_locale[ fields[0] ];
        } else {
            val = val[ fields[i] ];
        }

        if(val == null) {
            return(null);
        }
    } /* for */

    return(val);
}
]]
