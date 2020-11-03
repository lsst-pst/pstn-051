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
The baseline 'standard survey strategy' run, which can be used as a general comparison point. Except for changes in the defaults, this is the same general survey strategy as in previous releases, using the standard survey footprint and pairs of visits in each night in mixed filters. There is a baseline using 1x30s visits (baseline_v1.5_10yrs) and one using 2x15s visits (baseline_2snaps_v1.5_10yrs). The project official baseline will remain 2x15s visits, so this is a good run to evaluate; however we have used the 1x30s visits as the default in the other families, so baseline_v1.5_10yrs is the one to use to compare survey strategy variation effects against standard strategy.  Note that in the SCOC report, the 'same_filter' run, where pairs of visits were taken in the same filter instead of mixed filters, is grouped into this family. The takeaway from this family is that we should use 1x30s visits if we can for a 9% efficiency boost (but we must carry 2x15s visits as contingency) and mixed filters provides useful information for transients and variables at a 4% cost in efficiency compared to the 'same_filter' run.

Runs | Visit Variation | Pairs | 
 :---- | :-----: | :------: |
baseline_2snaps_v1.5_10yrs.db | 2x15s visits | Mixed filters |
baseline_v1.5_10yrs.db | 1x30s visits | Mixed filters | 
baseline_samefilt_v1.5_10yrs.db | 1x30s visits | Same filter |

* [third_obs](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/third_obs/) 
This family of simulations adds a third visit per night to augment the pairs of visits: adding a *g*, *r* or *i* visit at the end of the night in the WFD. The amount of the night dedicated to this third visit varies across the family, from 15 minutes to 120 minutes (corresponding to covering approximately one blob to about five, or half of the night's pairs receiving a third visit). We find the third visit decreases the amount of sky imaged in each night and has an accompanying  negative impact on metrics which prefer more sky area within a given time (such as solar system discovery and slower transient metrics, such as SNIa) -- the amount of this impact varies from negligible to noticeable depending on how much time is allocated to the third visit. 

Runs | Amount of time for third visit |
:---- | :----: |
third_obs_pt15v1.5_10yrs.db  | 15 minutes
third_obs_pt30v1.5_10yrs.db  | 30 minutes 
third_obs_pt45v1.5_10yrs.db  | 45 minutes
third_obs_pt60v1.5_10yrs.db  | 60 minutes 
third_obs_pt90v1.5_10yrs.db  | 90 minutes
third_obs_pt120v1.5_10yrs.db | 120 minutes

* [wfd_depth](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/wfd_depth/) 
This family varies the emphasis or weight on the WFD, using a standard survey strategy. The amount of time spent on the WFD scales up and down .. while the time spent on other areas changes in response. This family helps demonstrate how metrics respond to the number of visits in the WFD, as well as highlighting how metrics depend on visits in the accompanying mini-survey regions. The fraction of visits spent on WFD varies from 60% to 99%, with and without the standard DDF mini-surveys, which require 5% of the total visits when present. From these simulations we determined that between 1.65 and 1.7M visits are required to cover 18K square degrees of the standard WFD to a minimum number of visits of 825 per pointing; some of this variation comes from over and under subscription in some parts of the sky leading to unevenness in coverage. 

Runs | DDF? | Weight on WFD footprint | Approximate Nvisits WFD 
wfd_depth_scale0.65_noddf_v1.5_10yrs.db  | No | 65%  | 
wfd_depth_scale0.65_v1.5_10yrs.db | Yes | 65% (~60% after DDF) | 
wfd_depth_scale0.70_noddf_v1.5_10yrs.db | No | 70%  |
wfd_depth_scale0.70_v1.5_10yrs.db 
wfd_depth_scale0.75_noddf_v1.5_10yrs.db
wfd_depth_scale0.75_v1.5_10yrs.db
wfd_depth_scale0.80_noddf_v1.5_10yrs.db
wfd_depth_scale0.80_v1.5_10yrs.db
wfd_depth_scale0.85_noddf_v1.5_10yrs.db
wfd_depth_scale0.85_v1.5_10yrs.db
wfd_depth_scale0.90_noddf_v1.5_10yrs.db
wfd_depth_scale0.90_v1.5_10yrs.db
wfd_depth_scale0.95_noddf_v1.5_10yrs.db
wfd_depth_scale0.95_v1.5_10yrs.db
wfd_depth_scale0.99_noddf_v1.5_10yrs.db
wfd_depth_scale0.99_v1.5_10yrs.db


* [filter_dist](https://epyc.astro.washington.edu/~lynnej/opsim_downloads/fbs_1.5/filter_dist/) 
This family varies the distribution of visits between filters across the standard WFD footprint -- ie, taking more *u* band and less *z* or other variations. Our baseline filter distribution is nominally set to optimize photo-z measurements, but it would be nice to quantify how well photo-z and other transients perform with different filter distributions. We do not have a photo-z metric at this time, but generally we find transients and variable stars metrics favor bluer distributions of filters while solar system and galaxy metrics prefer redder distributions of filters. 



