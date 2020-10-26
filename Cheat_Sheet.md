**Family Summaries**

A high level description of the families of simulations investigated in the SCOC report. They are listed here in the order described in the SCOC report.
Unless otherwise noted: 
* Visits are always 1x30s long (not 2x15s). These 1x30s simulations achieve about 2.2M visits over 10 years. 
* Pairs of visits in each night are in two filters as follows: u-g, u-r, g-r, r-i, i-z, z-y or y-y. Pairs are scheduled for approximately 22 minutes separation. Almost every visit in gri has another visit within 50 minutes.
* The survey footprint is the standard baseline footprint, with 18K square degrees in the WFD reaching from -62 to +2 degrees (excluding the galactic plane), and additional coverage for the North Ecliptic Spur (NES), the Galactic Plane (GP) and South Celestial Pole (SCP). Five DD fields are included, with the fifth field being composed of two pointings covering the Euclid Deep Field - South (EDF-S), devoting 5% of the total survey time to DD fields. 

Family Details:

* [u_pairs](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.4/u_pairs/)  
A family where we varied how *u* band visits were paired with other filters, pairing *u* with *g* or *r* band filters (previous simulations had taken *u* in singletons or only paired with *u* itself). We also varied the number of visits in *u* band and when the *u* band was loaded in or out of the camera. The takeaway from this family was that we should pair *u* with *g* or *r* (instead of taking single images) and we should load the filter in/out of the camera at 40% lunar illumation (about new moon +/- 6 nights). 

 Runs | Filter load/unload (% lunar illumination) | *u* band weight (scale * standard number of visits)
 :---- | :-----: | :------: |
uparis_illum_15_scale1v1.4_10yrs.db | 15 | 1 |
uparis_illum_15_scale2v1.4_10yrs.db | 15 | 2 |
uparis_illum_15_scale4v1.4_10yrs.db | 15 | 4 |
uparis_illum_30_scale1v1.4_10yrs.db | 30 | 1 |
uparis_illum_30_scale2v1.4_10yrs.db | 30 | 2 |
uparis_illum_30_scale4v1.4_10yrs.db | 30 | 4 |
uparis_illum_40_scale1v1.4_10yrs.db | 40 | 1 |
uparis_illum_40_scale2v1.4_10yrs.db | 40 | 2 |
uparis_illum_40_scale4v1.4_10yrs.db | 40 | 4 |
uparis_illum_60_scale1v1.4_10yrs.db | 60 | 1 |
uparis_illum_60_scale2v1.4_10yrs.db | 60 | 2 |
uparis_illum_60_scale4v1.4_10yrs.db | 60 | 4 |

* [baseline](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/baseline/)  
The baseline 'standard survey strategy' run, which can be used as a general comparison point. Except for changes in the defaults, this is the same general survey strategy as in previous releases, using the standard survey footprint and pairs of visits in each night in mixed filters. There is a baseline using 1x30s visits (baseline_v1.5_10yrs) and one using 2x15s visits (baseline_2snaps_v1.5_10yrs). The project official baseline will remain 2x15s visits, so this is a good run to evaluate; however we have used the 1x30s visits as the default in the other families, so baseline_v1.5_10yrs is the one to use to compare survey strategy variation effects against 'standard' strategy.  Note that in the SCOC report, the 'same_filter' run, where pairs of visits were taken in the same filter instead of mixed filters, is grouped into this family. The takeaway from this family is that we should use 1x30s visits if we can for a 9% efficiency boost (but we must carry 2x15s visits as contingency) and mixed filters provides useful information for transients and variables at only 4% cost in efficiency.


