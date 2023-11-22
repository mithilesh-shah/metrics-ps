clear 

rename LeveloftheSP500Index SP_t
gen t = _n
gen SP_0 = 55.61 
gen x_t = ln(SP_t/SP_0)