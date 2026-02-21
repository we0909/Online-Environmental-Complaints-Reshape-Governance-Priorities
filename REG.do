

xtset cityfactor year

global cartlist " lnpop lnrgdp lninter lnenviron lnelec lnedu "
global airlist "lnwind_speed lncumuli_pre lnaver_temper lnsunshine_hour lnaver_humid"

//lnst is Environmental governance (lnEG);
//lnener is Energy transition(lnET)


//Table 4
xtreg lnst lnpublic,fe r
outreg2 using baseregression.doc,replace tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnst lnpublic $cartlist $airlist ,fe r
outreg2 using baseregression.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnener lnpublic,fe r
outreg2 using baseregression.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnener lnpublic $cartlist $airlist ,fe r
outreg2 using baseregression.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )



//Table 5
xtreg lnst lnpublic $cartlist $airlist if region == 1,fe r
outreg2 using region.doc,replace tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnst lnpu $cartlist $airlist if region == 2,fe r
outreg2 using region.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnst lnpu $cartlist $airlist if region == 3,fe r
outreg2 using region.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnener lnpu $cartlist $airlist if region == 1,fe r
outreg2 using region.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnener lnpu $cartlist $airlist if region == 2,fe r
outreg2 using region.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )
xtreg lnener lnpu $cartlist $airlist if region == 3,fe r
outreg2 using region.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )


//Figure 4 original data

xtreg lnt1 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) replace addtext(City FE, YES)
xtreg lnt4 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt5 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt6 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt7 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt8 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt9 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt10 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt11 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt12 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt13 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt14 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt15 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt16 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt17 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)
xtreg lnt18 lnpu $cartlist $airlist ,fe r
outreg2 using not_environ_energy.xls, sideway stats( coef se tstat pval ci) bdec(4) tdec(3) cd(3) append addtext(City FE, YES)

//Robustness of the Panel Estimation Model
//Table 6 The results for environmental and energy topics in government reports
xtlogit t2 lnpu $cartlist $airlist ,fe nolog
outreg2 using robustlogit.doc,replace tstat bdec(3) tdec(2) addtext(City FE, YES )
xtlogit t3 lnpu $cartlist $airlist ,fe nolog
outreg2 using robustlogit.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES )


//4.4.6 Other Political Interference
//Table 7 The impact of potential political background interference
xtreg lnst lnpu $cartlist $airlist lncos,fe r
outreg2 using distureRobustresults.doc,replace tstat bdec(3) tdec(2) addtext(City FE, YES)
xtreg lnener lnpu $cartlist $airlist lncos,fe r
outreg2 using distureRobustresults.doc,append tstat bdec(3) tdec(2) addtext(City FE, YES)


//4.4.8 Endogeneity-Related Robustness Checks
//Table 9 Results of the instrumental variable analysis for verifying the causality
//lnTnear is Total number of public complaints from neighboring cities
//lnMnear is Average public complaints from neighboring cities
xtivreg2 lnst lncos $cartlist $airlist (lnpu = lnTnear),fe first savefp(first)
eststo second
est restore  firstlnpublic
outreg2  using IV.doc,cttop(first) tstat bdec(3) tdec(2) replace
est restore second
outreg2  using IV.doc,cttop(second) tstat bdec(3) tdec(2)


xtivreg2 lnst lncos $cartlist $airlist (lnpu = lnMnear),fe first savefp(first)
eststo second
est restore  firstlnpublic
outreg2  using IVM.doc,cttop(first) tstat bdec(3) tdec(2) replace
est restore second
outreg2  using IVM.doc,cttop(second) tstat bdec(3) tdec(2)


//To ensure comparability, the spatial regression and GMM estimations are conducted using a balanced panel sample.
//4.4.7 Placebo Examination of Spatiotemporal Lag Effects
//Table 8 Spatiotemporal lag effects of public participation on government work
spatwmat using "D:\研究论文_博士\政府工作偏好_ZS\redeal\STATA\1_w.dta", name(W) standardize
use "D:\研究论文_博士\政府工作偏好_ZS\redeal\STATA\balance_data.dta"
global cartlist " lnpop lnrgdp lninter lnenviron lnelec lnedu "
global airlist "lnwind_speed lncumuli_pre lnaver_temper lnsunshine_hour lnaver_humid"

xsmle lnst L_lnst lnpu $cartlist $airlist if year>=2017, wmatrix(W) ematrix(W) model(sac) fe r type(both)
outreg2 using "lnst_spatial_results.doc", replace word keep(L_lnst lnpu lnpop lnrgdp lninter lnenviron lnelec lnedu lnwind_speed lncumuli_pre lnaver_temper lnsunshine_hour lnaver_humid)
xsmle lnener L_lnener lnpu $cartlist $airlist if year>=2017, wmatrix(W) ematrix(W) model(sac) fe r type(both)

//
//Table 10 GMM estimation of the impact of public participation on government work
eststo clear

xtabond2 lnst L(1/2).lnst lnpu $cartlist $airlist,  gmm(L(1/2).lnst lnpu, lag(2 .) collapse) iv($cartlist $airlist) twostep robust

eststo ST
esttab ST using "ST_gmm_results.rtf", replace b(%9.3f) se(%9.3f) star(* 0.1 ** 0.05 *** 0.01) stats(ar1p ar2p hansen sargan diffhansen, labels("AR(1) p-val" "AR(2) p-val" "Hansen p-val" "Sargan p-val" "Diff-Hansen p-val")) title("Dynamic Panel System GMM Results") alignment(c)

xtabond2 lnener L2.lnener lnpu $cartlist $airlist,  gmm(L2.lnener lnpu, lag(2 .) collapse) iv($cartlist $airlist) twostep robust

eststo EN 
esttab EN using "ENERGY_gmm_results.rtf", replace b(%9.3f) se(%9.3f) star(* 0.1 ** 0.05 *** 0.01) stats(ar1p ar2p hansen sargan diffhansen, labels("AR(1) p-val" "AR(2) p-val" "Hansen p-val" "Sargan p-val" "Diff-Hansen p-val")) title("Dynamic Panel System GMM Results (ENERGY)")alignment(c)



//4.4.9 Multiple-testing correction for Non-Energy and Non-Environment Issues
//Table 11 Table11 Multiple-testing corrections
//The p-values employed in the tests correspond to those reported in Figure 4.

clear
input double pval
0.140
0.001
0.301
0.648
0.033
0.019
0.910
0.000
0.105
0.000
0.164
0.363
0.017
0.564
0.065
0.000
end

multproc, pvalue(pval) method(liu1)
multproc, pvalue(pval) method(liu2)
multproc, pvalue(pval) method(simes)
multproc, pvalue(pval) method(yekutieli)

//






