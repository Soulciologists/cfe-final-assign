* Load data
use "data/derived/derived_import.dta", clear

* histogram to look at distribution
hist usa_imp_sa, bin(10)
hist ln_usa_imp_sa, bin(10)

* regression
reg cpi_sa usa_imp_sa
reg cpi_sa ln_usa_imp_sa

* regression graph
graph twoway lfit cpi_sa usa_imp_sa || scatter cpi_sa usa_imp_sa
graph twoway qfit cpi_sa usa_imp_sa || scatter cpi_sa usa_imp_sa


graph twoway lfit cpi_sa ln_usa_imp_sa || scatter cpi_sa ln_usa_imp_sa

* save graph (run code for graph first then save)
graph export "data/graph/hist_usa_imp.png"
graph export "data/graph/hist_usa_imp_ln.png"
graph export "data/graph/reg_cpi_imp_qfit.png"