clear

// Load the data
import excel "C:\Users\mithileshshah\OneDrive - London Business School\PhD-LBS\Phd-2nd Year\4th term\Econometrics-1\Problem Sets\PS3\PS4data.xls", sheet("data") firstrow


// Rename variables 
rename realconsumptionofnondurables cons_dur
rename realconsumptionofservices cons_ser
rename realdisposableincome income
rename population pop

// Calculate total consumption per capita and income per capita
gen cons_t = (cons_dur + cons_ser)/pop
gen inc = (income/pop)

// Create the lagged consumption and year variables
sort year quarter
gen cons_t_lag1 = cons_t[_n-1]
gen cons_t_lag2 = cons_t[_n-2]
gen cons_t_lag3 = cons_t[_n-3]
gen cons_t_lag4 = cons_t[_n-4]
gen cons_t_lag5 = cons_t[_n-5]
gen cons_t_lag6 = cons_t[_n-6]
gen logcons_t = ln(cons_t)
gen logcons_t_lag1 = ln(cons_t_lag1)
gen logcons_t_lag2 = ln(cons_t_lag2)
gen logcons_t_lag3 = ln(cons_t_lag3)
gen logcons_t_lag4 = ln(cons_t_lag4)
gen logcons_t_lag5 = ln(cons_t_lag5)
gen logcons_t_lag6 = ln(cons_t_lag6)
gen loginc_lag1 = ln(inc[_n-1])
gen loginc_lag2 = ln(inc[_n-2])
gen loginc_lag3 = ln(inc[_n-3])
gen loginc_lag4 = ln(inc[_n-4])
gen loginc_lag5 = ln(inc[_n-5])
gen loginc_lag6 = ln(inc[_n-6])
gen loginc = ln(inc)


// Solution (a)

reg delta_cons delta_inc
reg delta_cons loginc loginc_lag1

// Solution (b)

// Generate required lagged variables
gen delta_cons = logcons_t - logcons_t_lag1
gen delta_inc = loginc - loginc_lag1

// Run regression
reg delta_cons delta_inc


//Solution (c)

// Generate required isntruments  
gen delta_cons2 = logcons_t_lag2 - logcons_t_lag3
gen delta_cons3 = logcons_t_lag3 - logcons_t_lag4
gen delta_cons4 = logcons_t_lag4- logcons_t_lag5
gen delta_cons5 = logcons_t_lag5 - logcons_t_lag6

// Run two stage least square regression
ivregress 2sls delta_cons (delta_inc = delta_cons2 delta_cons3 delta_cons4 delta_cons5), vce(robust)

//Solution (d)
estat endogenous delta_inc
estat overid