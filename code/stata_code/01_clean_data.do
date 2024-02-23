*import data
import delimited "data/raw/work.csv", clear

*drop missing
drop if missing(usa_imp_sa, ind_prod_const, ind_prod_const_sa, cpi_sa)
misstable summarize

*change year and month to str
gen str year_str = string(year)
gen str month_str = string(month)

* drop observation before year 2000
drop if year < 2000

*keep relevant variables
keep country year_str usa_imp_sa ind_prod_const ind_prod_const_sa cpi_sa

*rename variables
rename year_str year

*create log(usa_imp_sa)
gen ln_usa_imp_sa = ln(usa_imp_sa)

*get statistic summary
summarize ln_usa_imp_sa, detail
summarize usa_imp_sa, detail

* see which import values are above mean
gen imp_above_mean = (usa_imp_sa > `r(mean)')
gen imp_above_med = (usa_imp_sa > `r(p50)')

*save cleaned data as dta
save "data/derived/derived_import.dta"