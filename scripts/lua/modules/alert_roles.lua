--
-- (C) 2021 - ntop.org
--
-- This file contains the alert roles constants

local dirs = ntop.getDirs()

-- ################################################################################


-- Alerts (Keep role_id in sync with ntop_typedefs.h AlertRole)
local alert_roles = {
   alert_role_any = {
      role_id = 0,
      -- TODO: if necessary, extend this with emoji, labels, etc.
   },
   alert_role_is_attacker = {
      role_id = 1,
   },
   alert_role_is_victim = {
      role_id = 2,
   },
   alert_role_is_both = {
      role_id = 3,
   },
}

-- ################################################################################

return alert_roles
