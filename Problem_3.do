clear

// Create the Beta Matrix
matrix beta = (-2.2587\2.7416\0.7082)
matrix list beta

// Create the Var-Cov Matrix
matrix cov_m = (0.0169,-0.0445,-0.0010\-0.0445,0.1293,-0.0018\-0.0010,-0.0018,0.0070)
matrix list cov_m

//Solution (a)

matrix mg_a = (1,0.3,1)
matrix list mg_a
matrix res_a = mg_a*beta
matrix list res_a

//Solution (b)

matrix se_a = mg_a*cov_m*mg_a'
matrix list se_a

//Solution (c)
matrix mg_b = (1,0.3,0)
matrix list mg_b
matrix res_b = mg_b * beta
matrix list res_b
matrix diff = res_a - res_b
matrix list diff 


//Solution (d)
matrix se_b = mg_b*cov_m*mg_b'
matrix list se_b