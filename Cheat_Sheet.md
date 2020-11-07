**Family Summaries**

A high level description of the families of simulations investigated in the SCOC report. They are listed here in the order described in the SCOC report.
Unless otherwise noted: 
* Visits are always 1x30s long (not 2x15s). These 1x30s simulations achieve about 2.2M visits over 10 years. 
* Pairs of visits in each night are in two filters as follows: u-g, u-r, g-r, r-i, i-z, z-y or y-y. Pairs are scheduled for approximately 22 minutes separation. Almost every visit in gri has another visit within 50 minutes.
* The survey footprint is the standard baseline footprint, with 18K square degrees in the WFD reaching from -62 to +2 degrees (excluding the galactic plane), and additional coverage for the North Ecliptic Spur (NES), the Galactic Plane (GP) and South Celestial Pole (SCP). Five DD fields are included, with the fifth field being composed of two pointings covering the Euclid Deep Field - South (EDF-S), devoting 5% of the total survey time to DD fields. 
* The standard balance of visits between filters is 6% in *u*, 9% in *g*, 22% in *r*, 22% in *i*, 20% in *z*, and 21 % in *y*. 
* *u* band is loaded in and out of the filter holder at 40% lunar illumination (corresponding to approximately new moon +/- 6 nights). 

As a quick way to approach 'decoding' a simulation run name: The name always starts with the family, followed by some encoding of how that particular run has implemented some survey strategy variation, followed by the release version (v1.5 or v1.6 for example), and ending with `_10yrs.db`. 
For example: `goodseeing_i_v1.5_10yrs.db` is from the `good seeing` family and contains at least one visit per year in i band ensured to be acquired in good seeing.
`footprint_gpsmooth_10yrs.db` is from the `footprint` family, and the variation on the survey footprint is that the Galactic Plane is covered at the same depth as the WFD. To decode the particular details of the survey strategy variation, it will likely be necessary to look at the description of the family in the release notes or the cheat sheet below. 


Family Details:

* [u_pairs](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.4/u_pairs/)  
A family where we varied how *u* band visits were paired with other filters, pairing *u* with *g* or *r* band filters (previous simulations had taken *u* in singletons or only paired with *u* itself). We also varied the number of visits in *u* band and when the *u* band was loaded in or out of the camera. The takeaway from this family was that we should pair *u* with *g* or *r* (instead of taking single images) and we should load the filter in/out of the camera at 40% lunar illumation (about new moon +/- 6 nights), based primarily on vastly improved efficiency in detecting and identifying transients. 
(note the typo in the run names below .. uparis should be translated to upairs, our apologies). 

 Run | Filter load/unload (% lunar illumination) | *u* band weight (scale * standard number of visits)
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
The baseline 'standard survey strategy' run, which can be used as a general comparison point. Except for changes in the defaults, this is the same general survey strategy as in previous releases, using the standard survey footprint and pairs of visits in each night in mixed filters. There is a baseline using 1x30s visits (baseline_v1.5_10yrs) and one using 2x15s visits (baseline_2snaps_v1.5_10yrs). The project official baseline will remain 2x15s visits, so this is a good run to evaluate; however we have used the 1x30s visits as the default in the other families, so baseline_v1.5_10yrs is the one to use to compare survey strategy variation effects against standard strategy.  Note that in the SCOC report, the 'same_filter' run, where pairs of visits were taken in the same filter instead of mixed filters, is grouped into this family. The takeaway from this family is that we should use 1x30s visits if we can for a 9% efficiency boost (but we must carry 2x15s visits as contingency) and mixed filters provides useful information for transients and variables at a 4% cost in efficiency compared to the 'same_filter' run.

Run | Visit Variation | Pairs |  Comment | 
 :---- | :-----: | :------: | :-----: |
baseline_2snaps_v1.5_10yrs.db | 2x15s visits | Mixed filters | Must maintain as project standard until on-sky, but loses 9% visits compared to 1x30s visits.
baseline_v1.5_10yrs.db | 1x30s visits | Mixed filters |  Great place to plan with, as adds 9% additional visits. Can't be adopted as standard yet.
baseline_samefilt_v1.5_10yrs.db | 1x30s visits | Same filter | Improve efficiency 4% above mixed filters, improves SSO discovery by 3-4%, but decreases transient and variable metrics by as much as 75% (SNIa 'well-sampled').

* [third_obs](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/third_obs/) 
This family of simulations adds a third visit per night to augment the pairs of visits: adding a *g*, *r* or *i* visit at the end of the night in the WFD. The amount of the night dedicated to this third visit varies across the family, from 15 minutes to 120 minutes (corresponding to covering approximately one blob to about five, or half of the night's pairs receiving a third visit). We find the third visit decreases the amount of sky imaged in each night and has an accompanying  negative impact on metrics which prefer more sky area within a given time (such as solar system discovery and slower transient metrics, such as SNIa) -- the amount of this impact varies from negligible to noticeable depending on how much time is allocated to the third visit. 

Run | Amount of time for third visit |
:---- | :----: |
third_obs_pt15v1.5_10yrs.db  | 15 minutes
third_obs_pt30v1.5_10yrs.db  | 30 minutes 
third_obs_pt45v1.5_10yrs.db  | 45 minutes
third_obs_pt60v1.5_10yrs.db  | 60 minutes 
third_obs_pt90v1.5_10yrs.db  | 90 minutes
third_obs_pt120v1.5_10yrs.db | 120 minutes

* [wfd_depth](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/wfd_depth/) 
This family varies the emphasis or weight on the WFD, using a standard survey strategy. The amount of time spent on the WFD scales up and down .. while the time spent on other areas changes in response. This family helps demonstrate how metrics respond to the number of visits in the WFD, as well as highlighting how metrics depend on visits in the accompanying mini-survey regions. The fraction of visits spent on WFD varies from 60% to 99%, with and without the standard DDF mini-surveys, which require 5% of the total visits when present. From these simulations we determined that between 1.65 and 1.7M visits are required to cover 18K square degrees of the standard WFD to a minimum number of visits of 825 per pointing; some of the range in that required number of visits comes from over and under subscription in some parts of the sky leading to unevenness in coverage. 

Run | DDF? | Weight on WFD footprint | Approximate Nvisits WFD (1x30s visits!) | Mean Nvisits per pointing WFD (1x30s visits!) |
:--- |  :--: | :--------------------: | :---------------------: | :----------------------------:| 
wfd_depth_scale0.65_noddf_v1.5_10yrs.db  | No | 65%  | 1583579 |	782 | 
wfd_depth_scale0.65_v1.5_10yrs.db | Yes | 65% (~60% after DDF) | 1510282 | 746 |
wfd_depth_scale0.70_noddf_v1.5_10yrs.db | No | 70%  | 1647459 | 776 |
wfd_depth_scale0.70_v1.5_10yrs.db | Yes | 70% (~65% after DDF) | 1572135 | 776 |
wfd_depth_scale0.75_noddf_v1.5_10yrs.db | No | 75% | 1718787 | 849 |
wfd_depth_scale0.75_v1.5_10yrs.db | Yes | 75% (~70% after DDF) | 1639466 | 810 | 
wfd_depth_scale0.80_noddf_v1.5_10yrs.db | No | 80% | 1795290 |  886 |
wfd_depth_scale0.80_v1.5_10yrs.db | Yes | 80% (~75% after DDF) | 1711002 | 845 |
wfd_depth_scale0.85_noddf_v1.5_10yrs.db | No | 85% | 1874046 | 925 |
wfd_depth_scale0.85_v1.5_10yrs.db | Yes | 85% (~80% after DDF) | 1784718 | 881 | 
wfd_depth_scale0.90_noddf_v1.5_10yrs.db | No | 90% | 1947907 |  961 | 
wfd_depth_scale0.90_v1.5_10yrs.db | Yes | 90% (~85% after DDF) | 1854673 |  916
wfd_depth_scale0.95_noddf_v1.5_10yrs.db | No | 95% | 2026223 | 1000 |
wfd_depth_scale0.95_v1.5_10yrs.db | Yes | 95% (~90% after DDF) | 1929864  | 953 |
wfd_depth_scale0.99_noddf_v1.5_10yrs.db | No | 99% | 2095078 |  1034 | 
wfd_depth_scale0.99_v1.5_10yrs.db | Yes | 99% (~95% after DDF) | 1995982 |  985 |

* [footprints](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/footprints/) 
This family varies the footprint of the survey, primarily focusing on WFD variations - extending footprint for the WFD into the N/S ('extended WFD'), varying the coverage of the bulge, and adding Magellanic Clouds. This family should generally be paired with the `bulge` family, as coverage of the WFD -- especially when moving the borders of the WFD around the Galactic Plane -- is strongly linked to the coverage of the Galactic Plane and between these two families there are significant overlaps. The extended WFD footprint still contains 18K square degrees, but shifted so as to use only low-dust-extinction regions for those 18K square degrees. In general, DESC static science metrics improve for the extended WFD; however, without additional galactic plane coverage (continued in the `bulges` family), metrics for other science goals tied to galactic populations drop significantly. 


Run | WFD limits | Description | Comment | 
:--- | :--------: | :---------: | :------: |
footprint_standard_goalsv1.5_10yrs.db | -62 < Dec < +2; tapering GP limit based on longitude ('classic') |  Standard classic baseline | Not enough galactic plane coverage, less than 18K square degrees with E(B-V)<0.2 (WFD includes dusty regions).
footprint_bluer_footprintv1.5_10yrs.db | -62 < Dec < +2; tapering GP limit based on longitude ('classic') | Baseline footprint but visit distribution is shifted toward bluer filters | Number of galaxies and SSOs falls with bluer filters; Transient detection improves (seen in filter_dist family also).
footprint_no_gp_northv1.5_10yrs.db | -62 < Dec < +2; tapering GP limit based on longitude ('classic') | Removes the northern tip of the GP | No significant change compared to standard baseline.
footprint_gp_smoothv1.5_10yrs.db | -62 < Dec < +2; with addition of tapered GP | Includes GP into WFD | Metrics tied to galactic populations (TDEs, etc) improve significantly; the number of visits per WFD pointing drops by about 7%. Less than 18K square degrees with E(B-V)<0.2 (WFD still includes dusty regions).
footprint_add_mag_cloudsv1.5_10yrs.db | -62 < Dec < +2 plus LMC/SMC extension; tapering GP limit based on longitude ('classic') | Adds Magellanic Clouds to WFD | Drops number of visits per WFD pointing by about 1.2%. 
footprint_stuck_rollingv1.5_10yrs.db | -62 < Dec < +2; tapering GP limit based on longitude ('classic') | Purposefully bad simulation where 1/2 of WFD is covered to almost twice the depth and the rest of the footprint receives 1/5th the normal number of visits. | Transients quite like this footprint, most metrics are bad. Technically could pass SRD requirements on median number of visits. 
footprint_big_sky_dustv1.5_10yrs.db | -72 < Dec < + 12; E(B-V)<0.2 dust extinction limits around GP ('extended dust') | Some additional northern coverage, no targeted NES, SCP or GP coverage. | DESC metrics favor this footprint, but lack of GP coverage is a problem for TVS metrics.
footprint_big_skyv1.5_10yrs.db | -72 < Dec < +12; galactic latitude > 15 | Some additional northern coverage, no targeted NES, SCP or GP coverage. | DESC metrics also like this footprint, but lack of GP coverage is a problem for TVS metrics.
footprint_big_sky_nouiyv1.5_10yrs.db | -72 < Dec < +12; galactic latitude > 15 | Some additional northern coverage, no targeted NES, SCP or GP coverage. No u, i, or y band coverage outside of WFD (northern area). |  DESC metrics also like this footprint, but lack of GP coverage is a problem for TVS metrics.
footprint_big_wfdv1.5_10yrs.db | -62 < Dec < +20; tapering GP limit based on longitude | Like the classic footprint, but with a bigger WFD. | Neutral compared to standard baseline for TVS (as the GP coverage is similar), improved metrics for DESC (as WFD now includes more area with low dust extinction), but number of visits per WFD pointing drops to ~760 even with 1x30s visits.
footprint_newAv1.5_10yrs.db | -72 < Dec < +12; galactic latitude > 15 | Attempt to 'do it all' and cover NES, SCP as in classic baseline, with bigger WFD, and GP covered to just slightly below WFD visits (~700/pointing). | Number of visits per WFD pointing drops to ~720 with 1x30s visits.
footprint_newBv1.5_10yrs.db | -72 < Dec < +12; galactic latitude > 15 | Tweak on the previous attempt to 'do it all', covering NES, SCP as in classic baseline, with bigger WFD, GP toward the bulge covered to ~700 visits/pointing, but GP with longitude > ~90 only receives ~300 visits per pointing. | Number of visits per WFD pointing drops to 790 with 1x30s visits, but TVS, Galaxy, and DESC metrics all show improvements above standard baseline. 

* [bulge](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/bulge/) 
This family of runs brings a variety of survey strategies to bear on the galactic bulge region, when using the extended WFD. In general, this family should be considered together with the `footprints` family.  In each of these simulations, the metrics for DESC static science improve compared to the standard baseline because more area is included with low dust extinction. However, the number of visits per WFD pointing drops to 760-750 (with 1x30s visits!) due to the larger area included in the WFD (when combined with coverage in the galactic plane, northern region, and SCP). 

Run | WFD limits | Description | Comment | 
:--- | :--------: | :---------: | :------: |
bulges_bs_v1.5_10yrs.db | -72 < Dec < +12; Galactic latitude > 8 | Cover large, dust-free WFD, but very light coverage of the galactic plane and bulge (about 250-300 visits per pointing) | Using fast microlensing as a representative of galactic transients, metrics are similar to the standard baseline. 
bulges_cadence_bs_v1.5_10yrs.db | -72 < Dec < +12; Galactic latitude > 8 | Cover large, dust-free WFD, but very light coverage of the galactic plane and bulge (about 300 visits per pointing). Adds a basis function to drive the cadence in the bulge region (galactic latitude < +/-10, galactic longitude < +/-20) to prioritize visits in bulge after 2.5 days. | Similar to standard baseline for fast microlensing.
bulges_bulge_wfd_v1.5_10yrs.db  | -72 < Dec < +12; Galactic latitude > 8  | Light coverage (~250) of galactic plane but WFD (825) level coverage of galactic bulge (galactic latitude < +/-10, galactic longitude < +/-20). | Improves metrics for fast microlensing, due to increase in the number of visits.
bulges_cadence_bulge_wfd_v1.5_10yrs.db | -72 < Dec < +12; Galactic latitude > 8  | Light coverage (~250) of galactic plane but WFD (825) level coverage of galactic bulge (galactic latitude < +/-10, galactic longitude < +/-20). Adds a basis function to drive coverage in the bulge every 2.5 days. | Improves metrics for fast microlensing, due to increase in the number of visits.
bulges_i_heavy_v1.5_10yrs.db | -72 < Dec < +12; Galactic latitude > 8  | Light coverage (~250) of galactic plane but WFD (825) level coverage of galactic bulge (galactic latitude < +/-10, galactic longitude < +/-20), with a shift toward i band visits.  | Improves metrics for fast microlensing, due to increase in the number of visits, but only slightly above the bulge wfd simulation above.
bulges_cadence_i_heavy_v1.5_10yrs.db | -72 < Dec < +12; Galactic latitude > 8  | Light coverage (~250) of galactic plane but WFD (825) level coverage of galactic bulge (galactic latitude < +/-10, galactic longitude < +/-20), with a shift toward i band visits. Adds a basis function to drive coverage in the bulge every 2.5 days. | Improves metrics for fast microlensing, due to increase in the number of visits, but only slightly above the bulge wfd simulation above.

* [filter_dist](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/filter_dist/) 
This family varies the distribution of visits between filters across the standard WFD footprint -- ie, taking more *u* band and less *z* or other variations. Our baseline filter distribution is nominally set to optimize photo-z measurements, but it would be nice to quantify how well photo-z and other transients perform with different filter distributions. We do not have a photo-z metric at this time, but generally we find transients and variable stars metrics favor bluer distributions of filters while solar system and galaxy metrics prefer redder distributions of filters. 

Run | Filter distribution | u g r i z y ratios
:-- | :------------------: | :---------:
filterdist_indx1_v1.5_10yrs.db | Uniform  | 1.00 1.00 1.00 1.00 1.00 1.00
filterdist_indx2_v1.5_10yrs.db | Baseline | 0.31 0.44 1.00 1.00 0.90 0.90
filterdist_indx3_v1.5_10yrs.db | g heavy  | 0.31 1.00 1.00 1.00 0.90 0.90
filterdist_indx4_v1.5_10yrs.db | u heavy  | 0.90 0.44 1.00 1.00 0.90 0.90
filterdist_indx5_v1.5_10yrs.db | z and y heavy | 0.31 0.44 1.00 1.00 1.50 1.50
filterdist_indx6_v1.5_10yrs.db | i heavy  | 0.31 0.44 1.00 1.50 0.90 0.90
filterdist_indx7_v1.5_10yrs.db | Bluer    | 0.50 0.60 1.00 1.00 0.90 0.90
filterdist_indx8_v1.5_10yrs.db | Redder   | 0.31 0.41 1.00 1.10 1.10 1.10

* [alt_roll_dust](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/alt_roll_dust/) 
These simulations use a non-standard survey footprint: an extended dust-limited WFD footprint (-72 < Dec < + 12; E(B-V)<0.2 dust extinction limits around GP) with light coverage of the GP, SCP and a northern extension instead of the NES. The versions with 'alt' in the name add an alt-scheduler nightly scheduling algorithm. The 'alt-scheduler' scheduling algorithm imposes a North/South nightly alternating cadence to observations; even nights would observe in a northern set of fields while odd nights would observe in a southern set of fields (for example). This adds a minimum 2-night revisit rate. The rolling cadence variations add a two-declination band rolling cadence. 

Run |  alt-scheduler nightly alternation | 2-band declination rolling cadence 
:-- |  :--------------------------------: | :-------------------------------:
alt_dust_v1.5_10yrs.db | Yes | No 
alt_roll_mod2_dust_sdf_0.20_v1.5_10yrs.db | Yes | Yes
roll_mod2_dust_sdf_0.20_v1.5_10yrs.db | No | Yes

* Rolling cadence. There are rolling_fpo runs in the report and simulation outputs. Unfortunately we've since learned that while the 2-band versions of these works as expected, the 3 and 6 band simulations don't seem to carry the appropriate weights on the rolling portion of the sky. We are in the process of replacing these simulations, using both an extended WFD footprint and a standard baseline footprint. 

* [DDFs](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/DDFs/) 
This contains implementations of both the AGN and the DESC requested DD strategy. [daily_ddf](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/daily_ddf/) is another DDF strategy, attempting to take daily DDF visits. 

Run | DDF sequences 
:--- | :-----------:
agnddf_v1.5_10yrs.db |
descddf_v1.5_10yrs.db |
daily_ddf_v1.5_10yrs.db |
