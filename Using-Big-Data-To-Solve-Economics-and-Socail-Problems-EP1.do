*load the data set by going to current directory in which the atlas file is saved
*for ie: <path to parent directory >\atlas.dta>
use atlas.dta
*find the mean of the bottom 25th percentile for our tract
list kfr_pooled_p25 if state == 42 & county == 101 & tract == 008801
*find mean of bottom 25th percentile for our county
summarize kfr_pooled_p25 if state == 42 & county == 101
*find mean of bottom 25th percentile for the state
summarize kfr_pooled_p25 if state == 42
*find mean of bottom 25th percentile for the country
summarize kfr_pooled_p25
*use the same commands to find standard deviations
summarize kfr_pooled_p25 if state == 42 & county == 101
summarize kfr_pooled_p25 if state == 42
summarize kfr_pooled_p25
*downward mobility at 75, 100 for tract, county, state, country
summarize kfr_pooled_p75 if state == 42 & county == 101 & tract == 008801
summarize kfr_pooled_p100 if state == 42 & county == 101 & tract == 008801
summarize kfr_pooled_p100 if state == 42 & county == 101
summarize kfr_pooled_p75 if state == 42 & county == 101
summarize kfr_pooled_p75 if state == 42
summarize kfr_pooled_p100 if state == 42
summarize kfr_pooled_p100
summarize kfr_pooled_p75
*linear regression for county
twoway (scatter kfr_pooled_p25 kfr_pooled_p75 if state == 42 & county == 101)
*export graph
graph export figure1.png, replace
*compare regressions across multiple races keeping the same dependent variable
reg kfr_white_p25 kfr_black_p25 if state == 42 & county == 101
reg kfr_white_p25 kfr_hisp_p25 if state == 42 & county == 101
reg kfr_white_p25 kfr_asian_p25 if state == 42 & county == 101
reg kfr_white_p75 kfr_black_p75 if state == 42 & county == 101
reg kfr_white_p75 kfr_hisp_p75 if state == 42 & county == 101
reg kfr_white_p75 kfr_asian_p75 if state == 42 & county == 101
*explore covariates with regression, scatter, and correlation
reg kfr_pooled_p25 singleparent_share2010 if state == 42 & county == 101
twoway (scatter kfr_pooled_p25 singleparent_share2010 if state == 42 & county == 101)
corr kfr_pooled_p25 frac_coll_plus2010 if state == 42 & county == 101
reg kfr_pooled_p25 emp2000 if state == 42 & county == 101
twoway (scatter kfr_pooled_p25 emp2000 if state == 42 & county == 101)
corr kfr_pooled_p25 emp2000 if state == 42 & county == 101
reg kfr_pooled_p25 singleparent_share2000 if state == 42 & county == 101
twoway (scatter kfr_pooled_p25 singleparent_share2000 if state == 42 & county == 101)
corr kfr_pooled_p25 singleparent_share2000 if state == 42 & county == 101


