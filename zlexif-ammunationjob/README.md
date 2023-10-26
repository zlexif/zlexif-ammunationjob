## Zlexif's Ammunations Job. / MADE BY RANJIT AND EDITED AND EVERYTHING BY ZLEXIF

[Preview](https://youtu.be/pDA9PXIOYAs?si=r4UjTNo1R9XRUgfm)
# join my **[Discord] https://discord.gg/XAV4AfgQaZ** | <-- FOR ANY SUPPORT. AS RANJIT IS NOT RESPONSIBLE FOR SUPPORT ON THIS.
ranjits discord https://discord.gg/867F5AvMCN Check it out. He's got plenty of good scripts!
# Required
- [qb-core](https://github.com/qbcore-framework/qb-core) (required)
- [qb-menu](https://github.com/qbcore-framework/qb-menu) (optional / IF USING ANOTHER MENU.)
- [qb-weapons](https://github.com/qbcore-framework/qb-weapons) (required)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory) (optional / IF USING ANOTHER INVENTORY)
- [qb-input](https://github.com/qbcore-framework/qb-input) (optional / IF USING ANOTHER INPUT)
- [qb-management](https://github.com/qbcore-framework/qb-management) (optional / IF USING ANOTHER MANAGEMENT SCRIPT)
- [qb-target](https://github.com/qbcore-framework/qb-target) (optional / IF USING ANOTHER TARGET))

# **qb-core/shared/items.lua**
```

## THIS DEPENDS ON QB-WEAPONS DEFAULT.
```

# **qb-core/shared/jobs.lua**
```
   ['ammunation'] = {
		label = 'Ammunation',
		defaultDuty = true, -- If whenever you see the job your defaultly on duty
		offDutyPay = false, -- If you want employees to be paid even when theyre not on duty/off duty ( THIS IS IN GAME NOT WHEN YOUR OFFLINE COMPLETELY)
		grades = {
            ['0'] = {
                name = 'Runner', - NAME OF THE GRADE
                payment = 25 -- PAYMENT FOR THIS GRADE ( EVERY 30 MINS OR ACCORDING TO YOUR loops.lua)  -- Configure According To Your Economy
            },
            ['1'] = {
                name = 'Salesman',
                payment = 50, -- Configure According To Your Economy
            },
            ['2'] = {
                name = 'Head Salesman',
                isboss = true,
                payment = 75, -- Configure According To Your Economy
            },
            ['3'] = {
                name = 'Asst. Manager',
                isboss = true,
                payment = 100,
            },
            ['4'] = {
                name = 'Manager',
                isboss = true,
                payment = 200, -- Configure According To Your Economy
            },
        },
	},
